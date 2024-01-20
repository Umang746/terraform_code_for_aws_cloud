variable "amiId"{
	
}

variable "AWS_REGION"{
	type = string
	
}

variable "instance_type"{
	type = map
	default = {
		dev = "t2.micro",
		test = "t2.small",
		prod = "t2.large"

	}
}
