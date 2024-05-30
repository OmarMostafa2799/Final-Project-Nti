resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCRy4yFcz9P4D1n5sD/yQCGNss3FT5plMpgRVj+tEz/5R/yuBw0vup5lJtC9uoBUH4tRtYebJ1KRKHM9wcMWMeIu1f+Q5ItKAOvqlEfJCF831k/ec7KkDu1Yciy5cFAG7W3l9h8cPyyFHm34ie2L6uUJtwqbcujxvM/zdyfdRmfAr7ogDrden2OzXXIspn5OP8nzLpq8UcBJCeixULjYM8d1+IJQKBsw8iZ7uWBtKXf1kUSWlwCdDFtYbKQtoZ99SOI+zMqXFXzsM7bF98olW1WV0FjVQ7VbDapCnbH4Sq1uBwESwWFN7SiDZcQllp+ifEPa3AzwXN42kce1PCLTR/CMx+ZOrhQyU/nQxqscixPTUV6MFgDXlMCs2sd25MIXZSkv5p2JWUXRGIEURfdZZY9Vpq49NT1GShqR/ZoK62uXoR+HgNogJhh12wU5HUFLY5CExrvGOSoZnBBnku11TYcRSVZXaehAF46evRTsSjFtCaXJeOOU2l0f2ZOFh+pXKmuhOWlo+pAUIGcPaWQXwcYX6i2w+0Z766iLWDAgDMjJVrvHIoKRedY5sZrJ2jTYGzSsnUEcc3skPKglAir7JQG8ZlCKuFhzgg58VngfD6x+rV8+hwp3qrw4Yv497W5Q8q7vwfAl3bpQGS/AdM7nkASWQTjKx6vahaQwF8+GRaN5Q== omar@omar-VirtualBox"


}



/*
resource "tls_private_key" "rsa" {
  algorithm   = "RSA"
  rsa_bits    = 4096
}


resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = tls_private_key.rsa.private_key_openssh

}

resource "local_file" "tf-key" {
  filename = "key.pem"
  content  = tls_private_key.rsa.private_key_pem
}
*/

