#

## PREREQUIREMENTS

Attach polichy(IAM)

- AmazonVPCFullAccess
- AmazonEC2FullAccess
- AmazonS3FullAccess
- AmazonRDSFullAccess
- AmazonRoute53FullAccess

## USAGE

```
cp secret.sh.tmpl .secret.sh
. ./.secret.sh
terraform apply tfs
```
