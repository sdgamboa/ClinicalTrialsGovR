
library(httr2)

## GET Studies ####
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

json_data$studies

## GET Stats ####

## GET Version ####
req <- request(base_url = apiServerBeta) |> 
    req_url_path_append("version")
resp <- req |> 
    req_perform()

json_data <- resp_body_json(resp)

purrr::reduce(.x = json_data, .f = ~ paste(.x, .y, sep = " "))

## Explore ####
req |> 
    req_dry_run()
resp |>
    resp_raw()