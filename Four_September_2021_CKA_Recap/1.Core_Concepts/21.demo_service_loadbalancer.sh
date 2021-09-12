apiVersion: v1
kind: Service
metadata:
  name: bkapp3
spec:
  type: LoadBalancer
  ports:
   - targetPort: 80 # Pod listens on this port, if we do not specify this value it assumes same as port.
     port: 80  # Service Port this is the only mandatory files
     nodePort: 30008  # Node listens on this port...can access using node IP-Address this is also optional
  selector:
    app: bkapp3
    type: front-end