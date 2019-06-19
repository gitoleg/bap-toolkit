  |                  |                                                                                                   |
  |   Artifacts      |                            Checks                                                                 |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | httpd-2.4.18     | ### Forbidden:                                                                                    |
  |                  | __errno_location abort atoi atol exit fprintf freopen getenv printf putchar puts sscanf           |
  |                  |                                                                                                   |
  |                  | ### Recursive:                                                                                    |
  |                  | ap_abort_on_oom ap_add_module_commands ap_die ap_rgetline_core                                    |
  |                  | ap_rxplus_exec ap_soak_end_container ap_strcasecmp_match ap_strcmp_match                          |
  |                  | child_main clean_child_exit count_directives_sub parse_errorlog_item                              |
  |                  | process_resource_config_fnmatch process_resource_config_nofnmatch sub_43e8ec sub_4404b0           |
  |                  | sub_45aa86 sub_45da01 sub_478d3d sub_48384a                                                       |
  |                  | sub_483ce2 sub_486162                                                                             |
  |                  |                                                                                                   |
  |                  | ### Complexity:                                                                                   |
  |                  | ap_core_output_filter ap_directory_walk ap_get_mime_headers_core ap_http_filter                   |
  |                  | ap_process_async_request ap_process_request_internal ap_read_request                              |
  |                  | ap_scan_script_header_err_core_ex ap_select_protocol ap_set_byterange                             |
  |                  | ap_setup_client_block basic_http_header default_handler event_check_config                        |
  |                  | log_error_core sub_483ce2                                                                         |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | libbfd-2.31.1    | Forbidden:                                                                                        |
  |                  | __errno_location abort ctime exit fclose ferror fflush fprintf fputc fputs fread fwrite           |
  |                  | getenv printf sprintf sscanf time vfprintf                                                        |
  |                  |                                                                                                   |
  |                  | Recursive:                                                                                        |
  |                  | _bfd_archive_64_bit_slurp_armap _bfd_coff_final_link _bfd_coff_gc_mark.part.11.constprop.14       |
  |                  |                                                                                                   |
