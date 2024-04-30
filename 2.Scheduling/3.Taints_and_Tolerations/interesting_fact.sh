The Scheduler does not schedule any pods on the master node....
why? why? why?
Reasons for Not Scheduling Pods on Master Node:

Security: Running application workloads on the master node can introduce security risks. If a Pod running on the master node is compromised, it could potentially gain access to sensitive cluster information or disrupt cluster operations.
Resource Management: The master node is responsible for critical control plane tasks like scheduling Pods and managing worker Nodes. Running application workloads on the master node can compete for resources and potentially affect the performance and stability of the cluster.
Separation of Concerns: Keeping the master node focused on control plane tasks promotes a clean separation of concerns within the cluster architecture.
Taint Mechanism:

Kubernetes uses taints to mark Nodes with specific characteristics that prevent Pods with matching tolerations from being scheduled on those Nodes.
By default, during cluster setup, a taint named node-role.kubernetes.io/master:NoSchedule is applied to the master node.
Pods in your deployments or StatefulSets wouldn't typically have tolerations for this taint, so they won't be scheduled on the master node.
Alternatives (Use with Caution):

Removing the Taint: You can remove the taint from the master node using kubectl taint nodes <master-node-name> node-role.kubernetes.io/master:NoSchedule- (not recommended for production environments due to the security risks mentioned earlier).
NodeSelector: You can define a nodeSelector in your Pod specifications to explicitly schedule Pods on Nodes other than the master node.
Important Note:

While it's technically possible to override the default behavior and schedule Pods on the master node, it's generally not recommended for production deployments. It's best practice to keep the master node dedicated to control plane tasks and leverage worker Nodes for running containerized applications.

When the kubernetes cluster is first setup, A "taint" is set on the master node automatically,
that prevents any pods from being schedule on the master node.

$ kubectl describe node kubemaster | grep Taint
Taints:       node-role.kubernetes.io/master:NoSchedule
$


