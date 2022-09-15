locals{
    pub_sub_ids = [for x in aws_subnet.pubsubnet : x.id]
}