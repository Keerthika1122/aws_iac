
resource "aws_s3_bucket" "My_bucket12" {
  bucket = "my-tf-bucket1728112023"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}