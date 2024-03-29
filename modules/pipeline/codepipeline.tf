resource "aws_codepipeline" "pipeline" {
  name     = "pipelineml"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.source.bucket
    type     = "S3"
  }

 stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "OAuthToken" = "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"
        "Branch"               = var.repository_branch
        "Owner"                = var.repository_owner
        "PollForSourceChanges" = "false"
        "Repo"                 = var.repository_name
      }
      input_artifacts = []
      name            = "Source"
      output_artifacts = [
        "SourceArtifact",
      ]
      owner     = "ThirdParty"
      provider  = "GitHub"
      run_order = 1
      version   = "1"
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceArtifact",]
      output_artifacts = ["imagedefinitions"]

      configuration = {
        ProjectName = "tfcodebuild"
      }
      
    }
  }

  stage {
    name = "Production"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["imagedefinitions"]
      version         = "1"

      configuration = {
        ClusterName = "mycluster"
        ServiceName = "mlservice"
        FileName    = "imagedefinitions.json"
      }
    }
  }
}

