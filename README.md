# terraform-socks-proxy-instance

## PREREQUIREMENTS

Attach polichy(IAM)

- AmazonVPCFullAccess
- AmazonEC2FullAccess
- AmazonS3FullAccess
- AmazonRDSFullAccess
- AmazonRoute53FullAccess

## USAGE

```
cp root.tf.tmpl root.tf
$EDITOR root.tf
terraform init
terraform apply
```

