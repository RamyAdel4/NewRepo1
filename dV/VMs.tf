resource "aws_instance" "webapp" {
  ami           = 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.first-subnet.id
  security_groups = [aws_security_group.webapp_sg.name]
   
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              docker run -d -p 80:80 your-webapp-image:latest
              EOF
}

resource "aws_instance" "mongodb" {
  ami           = 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.first-subnet.id
  security_groups = [aws_security_group.db_sg.name]
  
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              docker run -d -p 27017:27017 mongo:latest
              EOF
}

resource "aws_instance" "sqlserver" {
  ami           = 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.second-subnet.id
  security_groups = [aws_security_group.db_sg.name]
    
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              docker run -d -p 1433:1433 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=YourStrong!Passw0rd' mcr.microsoft.com/mssql/server:2019-latest
              EOF
}

resource "aws_instance" "redis" {
  ami           = 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.second-subnet.id
  security_groups = [aws_security_group.db_sg.name]
 
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              docker run -d -p 6379:6379 redis:latest
              EOF
}
