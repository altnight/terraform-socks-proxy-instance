resource "aws_s3_bucket" "bucket" {
  bucket = "${var.app_name}-bbbbucket"
  acl = "private"
  force_destroy = true
  tags {
    Name = "${var.app_name}-bucket"
  }
}

resource "aws_s3_bucket_object" "testobject" {
  bucket = "${aws_s3_bucket.bucket.bucket}"
  key = "new_object_key"
  source = ".gitignore"
  etag = "${md5(file(".gitignore"))}"
}
