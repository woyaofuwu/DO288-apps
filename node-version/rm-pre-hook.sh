#!/bin/bash

echo "Removing the pre life-cycle hook..."

# Remove pre life-cycle hook
oc patch dc/version --type=json --patch '[{"op":"remove", "path": "/spec/strategy/rollingParams/pre"}]'

[student@workstation node-version]$ cat slow.sh 
#!/bin/bash

echo "Changing the pre life-cycle hook to sleep for 1000 seconds..."

# Simulate a slow deployment
oc patch dc/version --patch '{"spec":{"strategy":{"rollingParams":{"pre":{"failurePolicy": "Abort","execNewPod":{"containerName":"version","command":["/bin/sh","-c","sleep 1000"]}}}}}}'

# Rollout new deployment with changes to hook
oc rollout latest dc/version