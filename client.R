
library(httr2)

apiServerBeta <- "https://beta-ut.clinicaltrials.gov/api/v2"
req <- request(base_url = apiServerBeta) |> 
    req_url_path_append("studies/NCT00841061") |> 
    req_url_query(
        format = "json",
        fields = "NCTId|BriefTitle|Reference"
    ) 
resp <- req |> 
    req_perform()
json_data <- resp_body_json(resp)

req |> 
    req_dry_run()
resp |>
    resp_raw()

json_data$studies

