# Konfigurasi Provider AWS (Misal pakai region Singapura)
provider "aws" {
  region = "ap-southeast-1"
}

# 1. Membuat Security Group (Firewall)
resource "aws_security_group" "bandha_sg" {
  name        = "bandha-production-sg"
  description = "Allow HTTP, HTTPS, SSH, and Node.js App traffic"

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (Nginx)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS (Certbot)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow API Port (Docker Node.js)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow All Outbound Traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Membuat EC2 Instance
resource "aws_instance" "bandha_server" {
  ami           = "ami-0123456789abcdef0" # Ganti dengan ID AMI Ubuntu 24.04 di region lu
  instance_type = "t3.micro"
  key_name      = "bandha-key"            # Sesuaikan dengan nama file .pem lu

  # Hubungkan dengan Security Group di atas
  vpc_security_group_ids = [aws_security_group.bandha_sg.id]

  # Storage 30GB gp3 sesuai Playbook lu
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name        = "Bandha-Production-Server"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}