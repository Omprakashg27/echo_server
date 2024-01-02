variable "vpc_id" {
  type    = string
  default = "vpc-01ae9b006e7bde114"
}

resource "aws_launch_configuration" "omprakash-node" {

        "nodegroupName": "omprakash-node",
        "clusterName": "omprakash-cluster",
        "capacityType": "ON_DEMAND",
        "scalingConfig": {
            "minSize": 2,
            "maxSize": 4,
            "desiredSize": 2
        },
        "instanceTypes": [
            "t2.small"
        ],
        "subnets": [
            "subnet-039faf399a22703f7",
            "subnet-0d86d0b1d023a35d6",
            "subnet-0faa07c950201ee7d"
        ],
        "amiType": "AL2_x86_64",
        "nodeRole": "arn:aws:iam::329082085800:role/default-eks-node-group-20230926134445948300000001",
        "labels": {},
        "resources": {
            "autoScalingGroups": [
                {
                    "name": "eks-omprakash-node-02c6603c-e5d4-420b-527c-ebec3d5af2d1"
                }
            ]
        },
        "diskSize": 20,
        "updateConfig": {
            "maxUnavailable": 2
        },
        "tags": {}
    }
}
  
}

resource "aws_autoscaling_group" "omprakash-node" {
                    "name": "eks-omprakash-node-02c6603c-e5d4-420b-527c-ebec3d5af2d1"
                
}
