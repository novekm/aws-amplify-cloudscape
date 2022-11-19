resource "local_file" "outputs" {
  filename = "${path.module}/outputs.json"
  content = jsonencode({
    comments = "DO NOT MODIFY THIS FILE MANUALLY. IT IS AUTOGENERATED ON SUCCESSFUL TERRAFORM APPLY. MAKE ANY NECESSARY CHANGES IN localfile.tf"
    outputs = {
      sample_aws_current_region = {
        value = "${data.aws_region.current.name}"
      },
      # AppSync
      sample_appsync_graphql_api_region = {
        value = "${data.aws_region.current.name}"
      },
      sample_appsync_graphql_api_id = {
        value = "${aws_appsync_graphql_api.sample_appsync_graphql_api.id}"
      },
      sample_appsync_graphql_api_uris = {
        value = {
          GRAPHQL  = "${aws_appsync_graphql_api.sample_appsync_graphql_api.uris.GRAPHQL}",
          REALTIME = "${aws_appsync_graphql_api.sample_appsync_graphql_api.uris.REALTIME}"
        }
      },
      # Cognito
      sample_user_pool_region = {
        value = "${data.aws_region.current.name}"
      },
      sample_user_pool_id = {
        value = "${aws_cognito_user_pool.sample_user_pool.id}"
      },
      sample_user_pool_client_id = {
        value = "${aws_cognito_user_pool_client.sample_user_pool_client.id}"
      },
      sample_identity_pool_id = {
        value = "${aws_cognito_identity_pool.sample_identity_pool.id}"
      },
      # S3
      sample_landing_bucket = {
        value = "${aws_s3_bucket.sample_landing_bucket.id}"
      },
      sample_input_bucket = {
        value = "${aws_s3_bucket.sample_input_bucket.id}"
      },
      sample_output_bucket = {
        value = "${aws_s3_bucket.sample_output_bucket.id}"
      },
      sample_app_storage_bucket = {
        value = "${aws_s3_bucket.sample_app_storage_bucket.id}"
      },

    }
  })

  # -- ugly way of doing it --
  # content = <<-EOF
  # {
  #   "outputs": {
  #     "sample_appsync_graphql_api_region": {
  #       "value": "${data.aws_region.current.name}"
  #     },
  #     "sample_appsync_grapql_api_id": {
  #       "value": "${aws_appsync_graphql_api.sample_appsync_grapql_api.id}"
  #     },
  #     "sample_appsync_grapql_api_uris": {
  #       "value": {
  #        "GRAPHQL": "${aws_appsync_graphql_api.sample_appsync_grapql_api.uris.GRAPHQL}",
  #        "REALTIME": "${aws_appsync_graphql_api.sample_appsync_grapql_api.uris.REALTIME}"
  #       }
  #     },
  #     "sample_user_pool_region": {
  #       "value": "${data.aws_region.current.name}"
  #     },
  #     "sample_user_pool_id": {
  #       "value": "${aws_cognito_user_pool.sample_user_pool.id}"
  #     },
  #     "sample_user_pool_client": {
  #       "value": "${aws_cognito_user_pool_client.sample_user_pool_client.id}"
  #     },
  #     "sample_identity_pool_id": {
  #       "value": "${aws_cognito_identity_pool.sample_identity_pool.id}"
  #     },
  #     "sample_input_bucket": {
  #       "value": "${aws_s3_bucket.sample_input_bucket.id}"
  #     },
  #     "sample_output_bucket": {
  #       "value": "${aws_s3_bucket.sample_output_bucket.id}"
  #     },
  #     "sample_app_storage_bucket": {
  #       "value": "${aws_s3_bucket.sample_app_storage_bucket.id}"
  #     }
  #   }
  # }
  # EOF

  # -- previously used but has unneccessary data from tfstate --
  # source = "./terraform.tfstate.outputs" -- previously used but has unneccessary data
}



