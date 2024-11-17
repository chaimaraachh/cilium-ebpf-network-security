#!/bin/bash

# Apply labels to workload nodes
kubectl label node k3d-cilium-cluster-agent-0 node-role.kubernetes.io/workload=workload
kubectl label node k3d-cilium-cluster-agent-1 node-role.kubernetes.io/workload=workload

# Apply label and taint to observability node
kubectl label node k3d-cilium-cluster-agent-2 node-role.kubernetes.io/observability=observability
kubectl taint nodes k3d-cilium-cluster-agent-2 dedicated=observability:NoSchedule

# Confirm changes
kubectl get nodes --show-labels
kubectl describe node k3d-cilium-cluster-agent-2 | grep Taints
