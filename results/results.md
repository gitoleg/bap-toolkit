

  |   Artifacts      |                            Checks                                                                 |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | **httpd-2.4.18** | **Forbidden:**                                                                                    |
  |                  | __errno_location abort atoi atol exit fprintf freopen getenv printf putchar puts sscanf           |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | ap_abort_on_oom ap_add_module_commands ap_die ap_rgetline_core                                    |
  |                  | ap_rxplus_exec ap_soak_end_container ap_strcasecmp_match ap_strcmp_match                          |
  |                  | child_main clean_child_exit count_directives_sub parse_errorlog_item                              |
  |                  | process_resource_config_fnmatch process_resource_config_nofnmatch sub_43e8ec sub_4404b0           |
  |                  | sub_45aa86 sub_45da01 sub_478d3d sub_48384a                                                       |
  |                  | sub_483ce2 sub_486162                                                                             |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | ap_core_output_filter ap_directory_walk ap_get_mime_headers_core ap_http_filter                   |
  |                  | ap_process_async_request ap_process_request_internal ap_read_request                              |
  |                  | ap_scan_script_header_err_core_ex ap_select_protocol ap_set_byterange                             |
  |                  | ap_setup_client_block basic_http_header default_handler event_check_config                        |
  |                  | log_error_core sub_483ce2                                                                         |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |**libbfd-2.31.1** | **Forbidden:**                                                                                    |
  |                  | __errno_location abort ctime exit fclose ferror fflush fprintf fputc fputs fread fwrite           |
  |                  | getenv printf sprintf sscanf time vfprintf                                                        |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | _bfd_archive_64_bit_slurp_armap _bfd_coff_final_link _bfd_coff_gc_mark.part.11.constprop.14       |
  |                  | _bfd_elf_adjust_dynamic_symbol _bfd_elf_compute_section_file_positions _bfd_elf_gc_mark           |
  |                  | _bfd_elf_get_property _bfd_elf_make_section_from_shdr _bfd_elf_write_object_contents              |
  |                  | _bfd_get_elt_at_filepos bfd_cache_lookup_worker bfd_compress_section_contents                     |
  |                  | bfd_elf_string_from_elf_section bfd_errmsg bfd_section_from_shdr bfd_set_error                    |
  |                  | cplus_demangle cplus_demangle_mangled_name cplus_demangle_type d_bare_function_type               |
  |                  | d_encoding d_expression_1 d_exprlist d_find_pack                                                  |
  |                  | d_name d_print_array_type.isra.10 d_print_mod_list d_template_args_1                              |
  |                  | demangle_qualified demangle_template_template_parm demangle_template_value_parm dlang_identifier  |
  |                  | dlang_parse_mangle dlang_parse_qualified elf_gc_propagate_vtable_entries_used                     |
  |                  | elf_i386_finish_dynamic_symbol elf_x86_64_finish_dynamic_symbol eval_symbol                       |
  |                  | find_abstract_instance.isra.29 higher_prime_index                                                 |
  |                  | internal_cplus_demangle on_needed_list qualifier_string read_attribute_value                      |
  |                  | rsrc_compute_region_sizes rsrc_count_directory rsrc_parse_directory rsrc_print_resource_directory |
  |                  | rsrc_sort_entries.part.8 rsrc_write_directory string_need sub_4c446                               |
  |                  | sub_577b0 sub_5b7a1 sub_5cb38 sub_5f9a0 sub_73e65 sub_73fc3 sub_758d0 sub_7b6e8                   |
  |                  | sub_7b718 sub_81dcb sub_81e0a sub_92288 sub_96fd0 sub_97009 sub_970a0 sub_970e9                   |
  |                  | sub_9bd4b sub_9f530 sub_ac1f8 sub_ac220 sub_ad7b6 sub_afb62 sub_b14eb sub_b3ac0                   |
  |                  | sub_b4000 sub_b473f sub_b49b8 sub_b4b35 sub_b545e sub_b9fe7 sub_bc4d6 sub_c4618                   |
  |                  | sub_c4640 sub_c5bd6 sub_c7f22 sub_c987b sub_d1cd8 sub_e9bb1                                       |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | _bfd_dwarf2_find_nearest_line _bfd_elf_discard_section_eh_frame _bfd_elf_map_sections_to_segments |
  |                  | _bfd_elf_merge_symbol _bfd_elf_slurp_version_tables _bfd_generic_link_output_symbols              |
  |                  | _bfd_link_section_stabs _bfd_merge_sections _bfd_stab_section_find_nearest_line                   |
  |                  | _bfd_x86_elf_finish_dynamic_sections _bfd_x86_elf_link_setup_gnu_properties bfd_elf_final_link    |
  |                  | bfd_elf_link_add_symbols bfd_elf_size_dynamic_sections coff_slurp_symbol_table.part.12            |
  |                  | coff_slurp_symbol_table.part.6 d_expression_1                                                     |
  |                  | d_exprlist decode_line_info demangle_arm_hp_template demangle_template elf_i386_check_relocs      |
  |                  | error_handler_internal eval_symbol                                                                |
  |                  | gnu_special internal_cplus_demangle pex64_bfd_print_pdata_section read_attribute_value            |
  |                  | scan_unit_for_symbols sub_42252 sub_5aa32 sub_5cb38                                               |
  |                  | sub_5f9a0 sub_6175a sub_631cc sub_67479 sub_682b9 sub_6b212 sub_6c157 sub_6d6fb                   |
  |                  | sub_6f331 sub_6fcb9 sub_70e55 sub_72d7b sub_740da sub_775d2 sub_79efa sub_81fe3                   |
  |                  | sub_8549b sub_86bf6 sub_8870a sub_90fd6 sub_923e1 sub_94948 sub_9a8fa sub_9bd4b                   |
  |                  | sub_9d5d2 sub_9f530 sub_a52c9 sub_a60d9 sub_a7ab2 sub_a9de9 sub_aa792 sub_ac4d0                   |
  |                  | sub_b0b07 sub_b272d sub_b5baf sub_b6dc9 sub_bb34a sub_bcb04 sub_be4c2 sub_c21d9                   |
  |                  | sub_c2b82 sub_c48f0 sub_caadd sub_cd959 sub_d1682 sub_dc4a6 sub_e4b5b                             |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | _bfd_abort sub_bbcc1 sub_e2b51                                                                    |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  | lighttpd-1.4.15  | **Forbidden:**                                                                                    |
  |                  | __errno_location abort exit fprintf fputc fputs fwrite getenv gmtime                              |
  |                  | puts setlocale signal strftime localtime mktime perror time                                       |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | array_init array_insert_uniq data_string_init proc_open_b                                         |
  |                  | sub_1163c sub_12091 sub_14d5 sub_1eee0 sub_1eee7 sub_bf08                                         |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | connection_handle_read_state sub_12091 sub_121be sub_18774                                        |
  |                  | sub_74e9 sub_97a2                                                                                 |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | fdevent_poll_event_get_revent                                                                     |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | nginx-1.7        | **Forbidden:**                                                                                    |
  |                  | __errno_location abort exit getenv localtime mktime raise rename strftime time                    |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | sub_4077f4 sub_409103 sub_409250 sub_4093A0 sub_409FA0 sub_40A7A0 sub_40A8D0 sub_40AEA0           |
  |                  | sub_40DAB0 sub_40DEC0 sub_411970 sub_412273 sub_418500 sub_41c0a4 sub_41c0ab sub_41c100           |
  |                  | sub_41d0b4 sub_4288e1 sub_42AC50 sub_4305E0 sub_430830 sub_430990 sub_430B70 sub_430DC0           |
  |                  | sub_434890 sub_434B20 sub_435890 sub_436e1d sub_437d02 sub_43C5E0 sub_43CE70 sub_4403b4           |
  |                  | sub_442be3 sub_4456f9 sub_44F360 sub_451940 sub_4532C0 sub_454f11 sub_458F80 sub_45c76c           |
  |                  | sub_45f060 sub_460da8 sub_460f83 sub_460fd8 sub_4621a1 sub_469a11 sub_46eecc sub_471B10           |
  |                  | sub_472b16 sub_47339a sub_473895 sub_479753 sub_47A870 sub_47ecd0 sub_48E510                      |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | sub_40FD90 sub_40c042 sub_416590 sub_418500 sub_41e7be sub_422BB0 sub_427A00 sub_430f6c           |
  |                  | sub_433710 sub_435da0 sub_43C5E0 sub_441D50 sub_443a40 sub_44A180 sub_44f36a sub_450E90           |
  |                  | sub_455df8 sub_45D180 sub_45a6a4 sub_46249d sub_463428 sub_46784a sub_469E70 sub_46BB70           |
  |                  | sub_46cda9 sub_472990 sub_475F70 sub_477310 sub_479DF0 sub_47C540 sub_480440 sub_4812B0           |
  |                  | sub_482960 sub_483C60 sub_4856B0 sub_486860 sub_48bc90 sub_48f567 sub_490470 sub_491F80           |
  |                  | sub_493797                                                                                        |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | sub_41B810 sub_425800 sub_426600 sub_426D00                                                       |
  |                  | sub_4273F0 sub_427A00 sub_47ecd0                                                                  |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | ntpd-4.2.8p5     | **Forbidden:**                                                                                    |
  |                  | __errno_location abort ctime exit fclose ferror fflush fgetc fgets fopen fprintf fputc            |
  |                  | fputs fread freopen fscanf fwrite getenv gmtime localtime mktime perror printf putchar            |
  |                  | puts rename rewind setvbuf sprintf sscanf strftime system time vfprintf                           |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | addArgListEntry adj_systime ao_malloc.part.30 ao_strdup.part.29                                   |
  |                  | change_logfile check_gen_fifo_consistency copy_addrinfo_list_impl ctl_putuint                     |
  |                  | ctl_putunqstr destroy_address_node dump_config_tree env_presets                                   |
  |                  | ereallocz free_res freesymkey genshelloptUsage                                                    |
  |                  | get_systime hack_restrict initialize_action isc__strerror                                         |
  |                  | isc_error_runtimecheck isc_log_doit isc_log_write isc_msgcat_get                                  |
  |                  | isc_sha1_update json_token_skip.part.2 list_restrict4 list_restrict6                              |
  |                  | maintain_activefds modem_control mprintf_event optionUsage                                        |
  |                  | peer_config print_one_paragraph.part.49 print_ver.part.56 prt_extd_usage                          |
  |                  | prt_opt_usage set_timer_or_die step_systime sub_11deb                                             |
  |                  | sub_11f00 sub_120a1 sub_120df sub_1214c sub_12313 sub_12b28 sub_12b46 sub_12c37                   |
  |                  | sub_12e0a sub_12e2f sub_12eed sub_1333a sub_133a2 sub_1350f sub_136c5 sub_197d8                   |
  |                  | sub_1a9e5 sub_1ae49 sub_1eea9 sub_22fd9 sub_2aae6 sub_2b1bd sub_2bdb0 sub_2bde1                   |
  |                  | sub_2be29 sub_394c9 sub_436e8 sub_577b4 sub_5a708 sub_5d3d4 sub_62073 sub_622e8                   |
  |                  | sub_6c094 sub_6d1f9 teljjy_control unload_arg_list                                                |
  |                  | update_interfaces                                                                                 |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | acts_receive arc_receive clock_select free_all_config_trees                                       |
  |                  | getCmdOpts gpsd_receive hack_restrict jsmn_parse                                                  |
  |                  | opt_find_long optionSetMembers read_network_packet sub_1246f                                      |
  |                  | sub_1376d sub_15056 sub_199e8 sub_1ae49 sub_1da6d sub_2499e sub_3e072 sub_436e8                   |
  |                  | sub_49b86 sub_622e8 sub_6c098 sub_6d1f9 sub_71589 sub_72ad3 sub_73522 sub_f7a6                    |
  |                  | timer update_interfaces yylex                                                                     |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | findexistingpeer getCmdOpts local_clock normal_dtoa                                               |
  |                  | optionRestore option_exits start_blocking_thread_internal sub_11deb                               |
  |                  | sub_1da6d sub_55f6f sub_69208 sub_6d1f9                                                           |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | ntpdc-4.2.8p5    | **Forbidden:**                                                                                    |
  |                  | __errno_location abort ctime exit fclose ferror fflush fgetc fgets fopen fprintf fputc            |
  |                  | fputs fread freopen fwrite getenv gmtime localtime longjmp perror printf putchar puts             |
  |                  | rename setbuf sprintf sscanf strftime system time vfprintf                                        |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | addArgListEntry ao_malloc.part.30 ao_strdup.part.29 do_env_opt                                    |
  |                  | docmd env_presets ereallocz freesymkey                                                            |
  |                  | genshelloptUsage initialize_action isc__strerror isc_error_runtimecheck                           |
  |                  | isc_log_doit isc_log_write isc_msgcat_get optionUsage                                             |
  |                  | print_one_paragraph.part.49 print_ver.part.56 prt_extd_usage prt_opt_usage                        |
  |                  | sub_101d6 sub_10498 sub_10578 sub_107af sub_162a4 sub_17409 sub_18780 sub_22443                   |
  |                  | sub_226b8 sub_ab13 sub_afa8 sub_b5c8 sub_b788 sub_bebc sub_c058 sub_c398                          |
  |                  | sub_c758 sub_cabc sub_cc49 sub_cdf7 sub_d5d0 sub_da18 sub_dd9a sub_e1a8                           |
  |                  | sub_e424 sub_e694 sub_e854 sub_e980 sub_eb84 sub_edb4 sub_f38c sub_f5f8                           |
  |                  | sub_f7f0 sub_fd30 sub_fe00 unload_arg_list                                                        |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | doquery opt_find_long sub_162a8 sub_17409 sub_1b799 sub_1cce3 sub_1d732 sub_226b8                 |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | optionRestore option_exits quit sub_13418 sub_17409                                               |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | openssl-1.1.0    | **Forbidden:**                                                                                    |
  |                  | __errno_location exit fclose fflush fgets fprintf fputc fputs                                     |
  |                  | fwrite getenv perror printf putchar puts rename setbuf signal time                                |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | app_malloc do_revoke dump_certs_pkeys_bag generate_cookie_callback                                |
  |                  | print_ssl_summary sub_45bed sub_45f45 sub_473b0                                                   |
  |                  | sub_4ffb6 sub_4ffd0 sub_50078 sub_5636d sub_58d90 sub_5d3b3 sub_5d818 sub_5f053                   |
  |                  | sub_67160 sub_671a5                                                                               |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | ca_main dgst_main do_body enc_main engine_main ocsp_main req_main s_server_main                   |
  |                  | smime_main srp_main sub_38c7c sub_3fdef sub_4b5a8 sub_4e510 sub_51459 sub_58d90                   |
  |                  | sub_5d3b3 sub_671b2 sub_6968c sub_715b6 www_body x509_main                                        |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | main                                                                                              |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | samba-4.7.6      | **Forbidden:**                                                                                    |
  |                  | __errno_location exit fprintf fwrite                                                              |
  |                  | printf puts signal time                                                                           |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | recursive_delete sig_term                                                                         |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | binary_smbd_main                                                                                  |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | smtpd-5.7.3p2    | **Forbidden:**                                                                                        |
  |                  | __errno_location ctime exit fclose feof ferror fflush fopen fprintf fputc fread fseek fwrite      |
  |                  | getenv localtime perror printf rename time vfprintf                                               |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | __xcalloc _rs_stir bounce_delivery ca                                                             |
  |                  | ca_init child_add expandtree_RB_INSERT_COLOR fatal                                                |
  |                  | filter_extend_chain fsqueue_envelope_path.constprop.4 fsqueue_message_incoming_path.constprop.7   |
  |                  | fsqueue_message_path.constprop.8 io_dispatch io_frame_leave m_add m_get_data                      |
  |                  | m_get_evpid mta_connect mta_drain offline_enqueue parse_sockaddr post_fork queue queue_proc_end   |
  |                  | queue_shutdown rsae_priv_dec scheduler_proc_end set_local                                         |
  |                  | smtp_reply ssl_setup stats_tree_RB_INSERT_COLOR sub_11b9d                                         |
  |                  | sub_12a23 sub_12a83 sub_19384 sub_1d4df sub_1e5f8 sub_1e5fc sub_1eaa0 sub_1eaa4                   |
  |                  | sub_1efe0 sub_1efe4 sub_1f6b0 sub_1f6b4 sub_1fba0 sub_1fba4 sub_21020 sub_21024                   |
  |                  | sub_22408 sub_22694 sub_227d0 sub_22c45 sub_22da9 sub_24818 sub_28bdb sub_2efef                   |
  |                  | sub_2f078 sub_2fc28 sub_30968 sub_31cbf sub_31dd3 sub_37ae8 sub_3e6c0 sub_3e6c4                   |
  |                  | sub_40210 sub_40214 sub_414ac sub_41efe sub_471c8 sub_47221 sub_47ad0 sub_47ad4                   |
  |                  | sub_47bcd sub_48773 sub_487d3 sub_7ebf sub_94f1 sub_af10 sub_af14 sub_c247 sub_e5a0 sub_e5a4      |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | envelope_ascii_dump envelope_load_buffer mta_connect sub_18014                                    |
  |                  | sub_1a9b6 sub_40eb2 sub_410c2 sub_49e34 yylex                                                     |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | queue_proc_call queue_proc_envelope_walk scheduler_proc_call sub_40eb2 sub_410c2 table_proc_call  |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | sqlite3-2.27.2   |                                                                                                   |
  |                  | **Forbidden:**                                                                                    |
  |                  | __errno_location atoi exit fclose fflush fgetc fgets fprintf                                      |
  |                  | fputc fputs fread fseek ftell fwrite getenv localtime                                             |
  |                  | printf putchar puts raise rewind setvbuf signal system time                                       |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | SortByDimension SortByDistance btreeOverwriteContent btreePrevious                                |
  |                  | btreeRestoreCursorPosition checkTreePage clearDatabasePage columnTypeImpl                         |
  |                  | deleteCell do_meta_command dupedExprSize eqp_render_level                                         |
  |                  | execSql exprAnalyze exprCodeBetween exprCodeVector                                                |
  |                  | exprDup exprSelectUsage findConstInWhere fixBoundingBox                                           |
  |                  | fts3EvalAllocateReaders fts3EvalNextRow fts3EvalRestart fts3EvalStartReaders                      |
  |                  | fts3EvalTestExpr fts3EvalTokenCosts fts3EvalUpdateCounts fts3ExprBalance                          |
  |                  | fts3ExprCheckDepth fts3ExprIterate2 fts3ExprLHitGather fts3NodeAddTerm.constprop.590              |
  |                  | fts3NodeFree fts3SegmentMerge fts3SelectLeaf fts5DlidxIterNextR                                   |
  |                  | fts5DlidxIterPrevR fts5ExprCheckPoslists fts5ExprClearPoslists fts5ExprNodeFirst                  |
  |                  | fts5ExprNodeZeroPoslist fts5ExprPrint fts5ExprPrintTcl fts5ExprSetEof                             |
  |                  | fts5ParseSetColset getRowTrigger isConsonant jsonEachComputePath                                  |
  |                  | jsonLookupStep jsonMergePatch jsonParseAddNode jsonParseFillInParentage                           |
  |                  | jsonParseValue jsonRemoveAllNulls multiSelectCollSeq nodeRelease                                  |
  |                  | patternCompare pushDownWhereTerms resolveExprStep rowSetNDeepTree                                 |
  |                  | rowSetTreeToList rtreeCheckNode rtreeInsertCell setJoinExpr                                       |
  |                  | shell_out_of_memory sqlite3BitvecDestroy sqlite3BitvecSet sqlite3BtreeNext                        |
  |                  | sqlite3BtreeTripAllCursors sqlite3CodeSubselect sqlite3CreateFunc sqlite3DeleteTable              |
  |                  | sqlite3ExprCode sqlite3ExprCodeTarget sqlite3ExprCompare sqlite3ExprDelete                        |
  |                  | sqlite3ExprDeleteNN sqlite3ExprDup sqlite3ExprIfFalse sqlite3ExprIfTrue                           |
  |                  | sqlite3ExprImpliesExpr sqlite3ExprIsInteger sqlite3FixExpr sqlite3FixSelect                       |
  |                  | sqlite3FixSrcList sqlite3Fts5ParseNodeFree sqlite3GenerateConstraintChecks sqlite3PcacheFetchFinis|
  |                  | sqlite3Select sqlite3SelectDelete sqlite3SelectDup sqlite3SrcListAssignCursors                    |
  |                  | sqlite3VdbeAddOp3 sqlite3VdbeChangeP4 sqlite3VdbeMemShallowCopy sqlite3WalkExpr                   |
  |                  | sqlite3WalkSelect sqlite3WhereBegin sqlite3WhereClauseClear sqlite3WhereExprAnalyze               |
  |                  | sqlite3WhereExprListUsage sqlite3WhereExprUsageNN sqlite3WhereSplit sqlite3_initialize            |
  |                  | sub_10083 sub_11acc sub_1aeaa sub_1b081 sub_24942 sub_2c353 sub_2cffa sub_34aed                   |
  |                  | sub_3a571 sub_3b634 sub_3bc87 sub_3fe9f sub_485f9 sub_4b49a sub_4dc64 sub_4dca6                   |
  |                  | sub_4dcb5 sub_502b2 sub_504b0 sub_5480f sub_548c8 sub_5a17a sub_5a631 sub_5b423                   |
  |                  | sub_5b4fc sub_62ac0 sub_62b49 sub_630dc sub_6f115 sub_6f6cc sub_6fd6b sub_728cf                   |
  |                  | sub_793a8 sub_88120 sub_88c5b sub_891d4 sub_8928a sub_8a0d5 sub_8a296 sub_8edf0                   |
  |                  | sub_8ef40 sub_91913 sub_9192f sub_96e93 sub_96f79 sub_9b9ef sub_9cac9 sub_9cb00                   |
  |                  | sub_a2286 sub_a2347 sub_a2364 sub_a2788 sub_a30f3 sub_a3311 sub_a337a sub_a33e2                   |
  |                  | sub_a7370 sub_a739e sub_a7637 sub_a7642 sub_a7694 sub_a7706 sub_ae05c substExpr                   |
  |                  | substSelect testcase_glob unsetJoinExpr valueFromExpr.constprop.626                               |
  |                  | vdbeMergeEngineFree vdbeMergeEngineInit.isra.301 vdbePmaReadBlob vdbePmaReaderNext                |
  |                  | walkExpr whereLoopAddBtreeIndex whereLoopAddOr whereUsablePartialIndex                            |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | allocateBtreePage do_meta_command exprAnalyze fts3InitVtab                                        |
  |                  | fts3SnippetFunc fts5MultiIterNew fts5PorterCb openDatabase                                        |
  |                  | pagerWalFrames porterNext process_input selectExpander                                            |
  |                  | sqlite3BtreeOpen sqlite3CreateIndex sqlite3ExprCodeTarget sqlite3Fts5UnicodeCatParse              |
  |                  | sqlite3Insert sqlite3ParseUri sqlite3WhereBegin sqlite3WhereCodeOneLoopStart                      |
  |                  | sqlite3_step sub_108f3 sub_1a0f5 sub_4174a sub_4c02e sub_4ccd8 sub_58179 sub_5a17a                |
  |                  | sub_5eed8 sub_5fccb sub_61c44 sub_68590 sub_6b05b sub_6bf45 sub_6cfd9 sub_6e922                   |
  |                  | sub_82bf7 sub_a160d sub_a417c sub_a538a sub_a6f32 sub_a993b sub_aafb1 unixOpen                    |
  |                  | whereLoopAddBtree wherePathSatisfiesOrderBy                                                       |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | sub_4de4e sub_62b49 sub_83d0a sub_852fe sub_8f005 sub_9192f sub_ae05c                             |
  |                  |                                                                                                   |
  |                  | **Null pointer dereference:**                                                                     |
  |                  | |----------|-------------------------|                                                            |
  |                  | | Address  | Function                |                                                            |
  |                  | |----------|-------------------------|                                                            |
  |                  | | 0x2B591  |                         |                                                            |
  |                  | | 0x3D25A  |                         |                                                            |
  |                  | |----------|-------------------------|                                                            |
  |                  |                                                                                                   |
  |                  | Unused return value:                                                                              |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | sshd-7.3.p1      | **Forbidden:**                                                                                    |
  |                  | __errno_location abort ctime exit fclose feof fflush fgetc fgets fopen fputc fputs fscanf         |
  |                  | fwrite getenv localtime perror putchar puts raise rename rewind sscanf strftime time              |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | BSDgetopt Blowfish_expand0state _rs_stir a2tun                                                    |
  |                  | addr_match_list atomicio auth2_challenge auth2_update_methods_lists                               |
  |                  | auth_debug_add auth_openfile auth_rhosts authorized_principals_file                               |
  |                  | barrett_reduce bcrypt_pbkdf buffer_consume buffer_consume_end_ret                                 |
  |                  | buffer_get_cstring_ret buffer_get_string buffer_get_string_ptr_ret cert_free                      |
  |                  | channel_decode_socks4.isra.10 channel_decode_socks5.isra.11 channel_free channel_handle_efd       |
  |                  | channel_new channel_setup_fwd_listener_streamlocal child_set_env cleanup_exit                     |
  |                  | collect_children compress_buffer.isra.4 connect_next.isra.5 crypto_sign_ed25519_ref_fe25519_mul   |
  |                  | crypto_sign_ed25519_ref_fe25519_sub crypto_sign_ed25519_ref_sc25519_from32bytes                   |
  |                  | crypto_sign_ed25519_ref_sc25519_mul do_child do_cleanup do_exec_no_pty do_exec_pty do_log         |
  |                  | do_motd.part.11 error fatal fatal_on_fatal_errors.part.0                                          |
  |                  | get_handle get_socket_address host_hash hostbased_key_allowed                                     |
  |                  | kex_derive_keys key_to_blob lastlog_get_entry load_hostkeys                                       |
  |                  | logdie login_alloc_entry login_get_lastlog login_write                                            |
  |                  | logit mac_compute match_pattern mkstemp                                                           |
  |                  | mm_auth2_read_banner mm_create mm_free mm_get_keystate                                            |
  |                  | mm_getpwnamallow mm_inform_authserv mm_key_allowed mm_make_entry                                  |
  |                  | mm_memvalid mm_request_receive_expect mm_session_pty_cleanup2 mm_terminate                        |
  |                  | mm_xmalloc mmtree_RB_INSERT_COLOR monitor_read packet_set_connection                              |
  |                  | parse_server_config process_do_stat read_mux send_attrib                                          |
  |                  | send_data_or_handle send_msg send_names send_status                                               |
  |                  | send_statvfs server_loop2 session_destroy_all session_new                                         |
  |                  | session_pty_cleanup session_unused sftp_server_main ssh_digest_memory                             |
  |                  | ssh_dispatch_run_fatal ssh_krl_revoke_cert_by_key_id                                              |
  |                  | ssh_krl_revoke_cert_by_serial_range ssh_krl_revoke_key_sha1                                       |
  |                  | ssh_packet_read_poll_seqnr ssh_packet_read_seqnr ssh_packet_send2 sshbuf_free                     |
  |                  | sshbuf_get_cstring sshbuf_get_string_direct sshbuf_put sshbuf_put_cstring                         |
  |                  | sshbuf_put_ec sshbuf_putf sshkey_check_revoked sshkey_fingerprint_raw                             |
  |                  | sshkey_from_blob_internal sshkey_load_file sshkey_load_private_cert sshkey_parse_private2.isra.9  |
  |                  | sshpkt_disconnect sshpkt_send sshpkt_start store_lastlog_message.isra.0                           |
  |                  | sub_1b8e8 sub_1b9c8 sub_1ba06 sub_20240 sub_205d1 sub_20950 sub_20953 sub_21438                   |
  |                  | sub_21bbd sub_224a3 sub_22503 sub_22ff8 sub_230cd sub_2310b sub_2334a sub_2e9a0                   |
  |                  | sub_2e9c5 sub_31afb sub_31b50 sub_31b69 sub_32504 sub_32520 sub_3d268 sub_407b1                   |
  |                  | sub_408e5 sub_40972 sub_481d3 sub_49c7e sub_4a36a sub_4ad50 sub_531ef sub_58318                   |
  |                  | sub_5e05c sub_5f98d sub_5fe7d sub_603a3 sub_606e0 sub_606ed sub_615a7 sub_615b4                   |
  |                  | sub_61920 sub_6192d sub_61dd6 sub_61f56 sub_61f71 sub_61fcc sub_624c4 sub_624c7                   |
  |                  | sub_62530 sub_6d180 sub_9b20 sub_9bdd sub_9c0a sub_9c55 sub_9d66 sub_9dc7                         |
  |                  | sub_a1b1 sub_a4aa sub_b0cf sub_b171 sub_b2a9 sub_b424 sub_bbf7 sub_bc05                           |
  |                  | sub_d0c0 subprocess.isra.1.part.2 userauth_finish xstrdup                                         |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | auth_parse_options copy_set_server_options fill_default_server_options hostkeys_foreach           |
  |                  | monitor_child_postauth session_input_channel_req sftp_server_main ssh_krl_from_blob               |
  |                  | sub_48db6 sub_60bcf sub_8e7f sub_a5bf                                                             |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | grace_alarm_handler log_init monitor_child_postauth server_input_channel_open                     |
  |                  | session_input_channel_req sub_497ec sub_5f830 sub_5fd20 userauth_pubkey                           |
  |                  |                                                                                                   |
  |                  | **Null pointer dereference:**                                                                     |
  |                  | |----------|-------------------------|                                                            |
  |                  | | Address  | Function                |                                                            |
  |                  | |----------|-------------------------|                                                            |
  |                  | | 0x3524C  |                         |                                                            |
  |                  | | 0x371D0  |                         |                                                            |
  |                  | | 0x6C41E  |                         |                                                            |
  |                  | |------------------------------------|                                                            |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | swfc-0.9.2       | **Forbidden:**                                                                                    |
  |                  | __errno_location clearerr ctime exit fclose feof ferror fflush                                    |
  |                  | fopen fprintf fputc fputs fread fseek ftell fwrite getenv perror printf putchar                   |
  |                  | puts rename sprintf time                                                                          |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | _trie_dump _trie_put add_parent args_callback_longoption                                          |
  |                  | as3__scan_bytes as3_ensure_buffer_stack callcode cut_last_push                                    |
  |                  | dump_asset dump_method enter_file enumerateUsedIDs                                                |
  |                  | filterState_free free_lines input insert_unresolved                                               |
  |                  | node_dump2 node_free registry_find registry_use                                                   |
  |                  | state_free sub_42928 sub_4b335 sub_5134b sub_5e73a sub_61a7a sub_67b07 sub_67dfe                  |
  |                  | sub_6ac1c sub_6ac48 sub_8589b sub_898cd sub_8a9a8 sub_8e2be sub_90b63 sub_9c24a                   |
  |                  | swf4_scan_bytes swf4restart swf5_scan_bytes swf5restart                                           |
  |                  | swf_ShapeSetLine swf_WriteTag use_asset write_asset                                               |
  |                  | yy_scan_bytes yyensure_buffer_stack                                                               |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | enumerateUsedIDs png_load png_write_palette_based2 writeABC                                       |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | zlib_error                                                                                        |
  |                  |                                                                                                   |
  |                  | **Null pointer dereference:**                                                                     |
  |                  | |-----------------------------------|                                                             |
  |                  | | Address   | Function              |                                                             |
  |                  | |-----------|-----------------------|                                                             |
  |                  | | 0xA854E   |                       |                                                             |
  |                  | | 0x72140   |                       |                                                             |
  |                  | | 0x5CB56   |                       |                                                             |
  |                  | | 0x66EF1   |                       |                                                             |
  |                  | | 0x63C8E   |                       |                                                             |
  |                  | | 0x955B1   |                       |                                                             |
  |                  | | 0xAC856   |                       |                                                             |
  |                  | | 0xAC810   |                       |                                                             |
  |                  | | 0xAC7D0   |                       |                                                             |
  |                  | | 0xAC38E   |                       |                                                             |
  |                  | | 0xA97ED   |                       |                                                             |
  |                  | | 0xA63C2   |                       |                                                             |
  |                  | | 0x95334   |                       |                                                             |
  |                  | | 0x9603C   |                       |                                                             |
  |                  | | 0x94E2B   |                       |                                                             |
  |                  | | 0x4EBF4   |                       |                                                             |
  |                  | | 0x486F4   |                       |                                                             |
  |                  | | 0xA8CDA   |                       |                                                             |
  |                  | | 0x6BFFE   |                       |                                                             |
  |                  | | 0x95C40   |                       |                                                             |
  |                  | | 0x88355   |                       |                                                             |
  |                  | |-----------------------------------|                                                             |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | swfcombine-0.9.2 | **Forbidden:**                                                                                    |
  |                  | __errno_location ctime exit fclose fflush fopen fprintf fputc fread fseek                         |
  |                  | ftell fwrite getenv perror printf putchar puts rename sprintf time                                |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | args_callback_longoption enumerateUsedIDs sub_2b7c swf_WriteTag                                   |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | enumerateUsedIDs main normalcombine write_master                                                  |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | main zlib_error                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | swfextract-0.9.2 | **Forbidden:**                                                                                    |
  |                  | __errno_location ctime exit fclose feof fflush fopen fprintf fputc fputs fread fseek              |
  |                  | ftell fwrite getenv perror printf putchar puts rename sprintf time                                |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | _trie_dump _trie_put args_callback_longoption callcode cut_last_push dump_asset                   |
  |                  | dump_method enumerateUsedIDs free_lines input registry_find registry_use                          |
  |                  | sub_43254 sub_46594 sub_55177 sub_551a3 sub_6e5a4 sub_72f95 sub_7583a swf4_scan_bytes             |
  |                  | swf4restart swf5_scan_bytes swf5restart swf_ShapeSetLine swf_WriteTag use_asset write_asset       |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | enumerateUsedIDs extractTag main png_load png_write_palette_based2 writeABC                       |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | zlib_error                                                                                        |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | tshark-2.6.0     | **Forbidden:**                                                                                    |
  |                  | __errno_location exit fclose ferror fflush fopen fputc fputs                                      |
  |                  | fwrite getenv putchar puts rename setlocale ungetc                                                |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | copy_filter_list flow_exit iostat_init phs_draw                                                   |
  |                  | sub_101da sub_119b7 sub_11d83 sub_154b0 sub_2086e sub_20e3b sub_20ec9 sub_20edc                   |
  |                  | sub_20eea sub_27930 sub_28f00 sub_29bd0 tree_traverse_pre_order.constprop.0                       |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | iostat_draw main sub_101fd sub_2e750                                                              |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  | **Null pointer dereference:**                                                                     |
  |                  | |-----------------------------------|                                                             |
  |                  | | Address   | Function              |                                                             |
  |                  | |-----------|-----------------------|                                                             |
  |                  | |0x2955B:64u|register_tap_listener  |                                                             |
  |                  | |-----------|-----------------------|                                                             |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | wav2swf-0.9.2    | **Forbidden:**                                                                                    |
  |                  | __errno_location ctime exit fclose fflush fopen fprintf fputc fread fseek ftell fwrite            |
  |                  | getenv perror printf putchar puts rename sprintf time                                             |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | args_callback_longoption enumerateUsedIDs input sub_11494 sub_13d39 sub_caa3 sub_db7e             |
  |                  | sub_dbee swf4_scan_bytes swf4restart swf5_scan_bytes swf5restart swf_WriteTag                     |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | enumerateUsedIDs                                                                                  |
  |                  |                                                                                                   |
  |                  | **Non-structured:**                                                                               |
  |                  | zlib_error                                                                                        |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  | wpa_cli-2.2      | **Forbidden:**                                                                                    |
  |                  | __errno_location atoi exit fclose fflush fopen fprintf fread fseek ftell getenv gmtime            |
  |                  | localtime mktime perror printf putchar puts signal system vprintf                                 |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |------------------|---------------------------------------------------------------------------------------------------|
  |                  |                                                                                                   |
  |wpa_supplicant-2.2| **Forbidden:**                                                                                    |
  |                  | __errno_location abort atoi exit fclose fgets fopen fprintf fputc fread fseek ftell               |
  |                  | fwrite gmtime localtime mktime perror printf putchar puts signal vprintf                          |
  |                  |                                                                                                   |
  |                  | **Recursive:**                                                                                    |
  |                  | eapol_sm_step sub_88c42 wpa_driver_nl80211_scan wpas_set_pkcs11_engine_and_module_path            |
  |                  |                                                                                                   |
  |                  | **Complexity (> 50):**                                                                            |
  |                  | nl80211_connect_common print_bss_info wpa_config_get_cred_no_key wpa_config_set_cred              |
  |                  | wpa_config_write_global wpa_driver_nl80211_set_ap wpa_sm_rx_eapol                                 |
  |                  | wpa_supplicant_ctrl_iface_process wpa_supplicant_req_sched_scan wpa_supplicant_scan               |
  |                  | wpas_start_assoc_cb                                                                               |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |                  |                                                                                                   |
  |----------------------------------------------------------------------------------------------------------------------|
