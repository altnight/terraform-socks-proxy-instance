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
docker-compose run --rm terraform init
docker-compose run --rm terraform apply
# grep ssh terraform.tfstate
# docker-compose run --rm terraform destroy
```

