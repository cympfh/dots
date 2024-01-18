aws-ssh() {
  instance_id=$(
    aws ec2 describe-instances --filters 'Name=instance-state-code,Values=16' \
    | jq -r '[.Reservations[].Instances[] |select(.PlatformDetails? != "Windows")| { id: .InstanceId, name: (try (.Tags[] | select(.Key=="Name").Value) catch "NO-NAME")}] | sort_by(.name) | .[] | .name + "\t" + .id' \
    | peco \
    | awk '{print $2}'
  )
  if [ -n "$instance_id" ]; then
    aws ec2-instance-connect send-ssh-public-key \
      --instance-id $instance_id \
      --instance-os-user ec2-user \
      --ssh-public-key file://~/.ssh/id_rsa.pub > /dev/null
    ssh $@ ec2-user@$instance_id
  fi
}

aws-scp() {
  param_count=$(echo $@ | grep -o '@remote' | wc -l)
  if [ $param_count -ne 1 ]; then
    echo "プレースホルダーパラメータ @remote が1つ必要です"
    echo "local to remote: aws-scp hoge.txt @remote:/tmp
    echo "remote to local: aws-scp @remote:/tmp/hoge.txt .
    return 1
  fi
  instance_id=$(
    aws ec2 describe-instances --filters 'Name=instance-state-code,Values=16' \
    | jq -r '[.Reservations[].Instances[] |select(.PlatformDetails? != "Windows")| { id: .InstanceId, name: (try (.Tags[] | select(.Key=="Name").Value) catch "NO-NAME")}] | sort_by(.name) | .[] | .name + "\t" + .id' \
    | peco \
    | awk '{print $2}'
  )
  if [ -n "$instance_id" ]; then
    aws ec2-instance-connect send-ssh-public-key \
      --instance-id $instance_id \
      --instance-os-user ec2-user \
      --ssh-public-key file://~/.ssh/id_rsa.pub > /dev/null
    scp ${@/@remote/ec2-user@$instance_id}
  fi
}


aws-ec2-start(){
  instance_id=$(
    aws ec2 describe-instances --filters 'Name=instance-state-name ,Values=stopped' \
    | jq -r '[.Reservations[].Instances[] | { id: .InstanceId, name: (.Tags[] | select(.Key=="Name").Value)}] | sort_by(.name) | .[] | .name + "\t" + .id' \
    | peco \
    | awk '{print $2}'
  )
  if [ -n "$instance_id" ]; then
    aws ec2 start-instances --instance-ids $instance_id
  fi
}

aws-ec2-list(){
  aws ec2 describe-instances | jq -r '
    [.[][].Instances
      | map({
        Name: [.Tags[] | select(.Key == "Name").Value][],
        Id: .InstanceId,
        State: .State.Name,
        PrivateIP: .PrivateIpAddress,
        InstanceType: .InstanceType,
        SecurityGroup: .SecurityGroups[].GroupName
      })
      | add
    ] | sort_by(.Name) as $v
    | $v | map(keys_unsorted) | unique as $header | $v | map(flatten) as $row | $header+$row | .[] | @tsv' |
    column -t
}
