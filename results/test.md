
Our results


<table style="width:100%">
      <tr>
        <th>Artifacts</th>
        <th>Checks</th>
      </tr>
      <tr>
        <td>httpd-2.4.18</td>
        <td>
          <h3>Forbidden:</h3>
          __errno_location abort atoi atol exit fprintf freopen getenv printf putchar puts sscanf

          <h3>Recursive:</h3>
          <pre>
            ap_abort_on_oom ap_add_module_commands ap_die ap_rgetline_core
            ap_rxplus_exec ap_soak_end_container ap_strcasecmp_match ap_strcmp_match
            child_main clean_child_exit count_directives_sub parse_errorlog_item
            process_resource_config_fnmatch process_resource_config_nofnmatch sub_43e8ec sub_4404b0
            sub_45aa86 sub_45da01 sub_478d3d sub_48384a
            sub_483ce2 sub_486162
          </pre>

          <h3>Complexity:</h3>
          <pre>
            ap_core_output_filter ap_directory_walk ap_get_mime_headers_core ap_http_filter
            ap_process_async_request ap_process_request_internal ap_read_request
            ap_scan_script_header_err_core_ex ap_select_protocol ap_set_byterange
            ap_setup_client_block basic_http_header default_handler event_check_config
            log_error_core sub_483ce2
          </pre>
        </td>
      </tr>
      <tr>
        <td>libbfd-2.31.1</td>
        <td>
          <h3>Forbidden:</h3>
          <pre>
            __errno_location abort ctime exit fclose ferror fflush fprintf fputc fputs fread fwrite
            getenv printf sprintf sscanf time vfprintf
          </pre>

          <h3>Recursive:</h3>
          <pre>
            _bfd_archive_64_bit_slurp_armap _bfd_coff_final_link _bfd_coff_gc_mark.part.11.constprop.14
            _bfd_elf_adjust_dynamic_symbol _bfd_elf_compute_section_file_positions _bfd_elf_gc_mark
            _bfd_elf_get_property _bfd_elf_make_section_from_shdr _bfd_elf_write_object_contents
            _bfd_get_elt_at_filepos bfd_cache_lookup_worker bfd_compress_section_contents
            bfd_elf_string_from_elf_section bfd_errmsg bfd_section_from_shdr bfd_set_error
            cplus_demangle cplus_demangle_mangled_name cplus_demangle_type d_bare_function_type
            d_encoding d_expression_1 d_exprlist d_find_pack
            d_name d_print_array_type.isra.10 d_print_mod_list d_template_args_1
            demangle_qualified demangle_template_template_parm demangle_template_value_parm dlang_identifier
            dlang_parse_mangle dlang_parse_qualified elf_gc_propagate_vtable_entries_used
            elf_i386_finish_dynamic_symbol elf_x86_64_finish_dynamic_symbol eval_symbol
            find_abstract_instance.isra.29 higher_prime_index
            internal_cplus_demangle on_needed_list qualifier_string read_attribute_value
            rsrc_compute_region_sizes rsrc_count_directory rsrc_parse_directory rsrc_print_resource_director
            rsrc_sort_entries.part.8 rsrc_write_directory string_need sub_4c446
            sub_577b0 sub_5b7a1 sub_5cb38 sub_5f9a0 sub_73e65 sub_73fc3 sub_758d0 sub_7b6e8
            sub_7b718 sub_81dcb sub_81e0a sub_92288 sub_96fd0 sub_97009 sub_970a0 sub_970e9
            sub_9bd4b sub_9f530 sub_ac1f8 sub_ac220 sub_ad7b6 sub_afb62 sub_b14eb sub_b3ac0
            sub_b4000 sub_b473f sub_b49b8 sub_b4b35 sub_b545e sub_b9fe7 sub_bc4d6 sub_c4618
            sub_c4640 sub_c5bd6 sub_c7f22 sub_c987b sub_d1cd8 sub_e9bb1
          </pre>

          <h3>Complexity:</h3>
          <pre>
            _bfd_dwarf2_find_nearest_line _bfd_elf_discard_section_eh_frame _bfd_elf_map_sections_to_segment
            _bfd_elf_merge_symbol _bfd_elf_slurp_version_tables _bfd_generic_link_output_symbols
            _bfd_link_section_stabs _bfd_merge_sections _bfd_stab_section_find_nearest_line
            _bfd_x86_elf_finish_dynamic_sections _bfd_x86_elf_link_setup_gnu_properties bfd_elf_final_link
            bfd_elf_link_add_symbols bfd_elf_size_dynamic_sections coff_slurp_symbol_table.part.12
            coff_slurp_symbol_table.part.6 d_expression_1
            d_exprlist decode_line_info demangle_arm_hp_template demangle_template elf_i386_check_relocs
            error_handler_internal eval_symbol
            gnu_special internal_cplus_demangle pex64_bfd_print_pdata_section read_attribute_value
            scan_unit_for_symbols sub_42252 sub_5aa32 sub_5cb38
            sub_5f9a0 sub_6175a sub_631cc sub_67479 sub_682b9 sub_6b212 sub_6c157 sub_6d6fb
            sub_6f331 sub_6fcb9 sub_70e55 sub_72d7b sub_740da sub_775d2 sub_79efa sub_81fe3
            sub_8549b sub_86bf6 sub_8870a sub_90fd6 sub_923e1 sub_94948 sub_9a8fa sub_9bd4b
            sub_9d5d2 sub_9f530 sub_a52c9 sub_a60d9 sub_a7ab2 sub_a9de9 sub_aa792 sub_ac4d0
            sub_b0b07 sub_b272d sub_b5baf sub_b6dc9 sub_bb34a sub_bcb04 sub_be4c2 sub_c21d9
            sub_c2b82 sub_c48f0 sub_caadd sub_cd959 sub_d1682 sub_dc4a6 sub_e4b5b
          </pre>

          <h3>Non-structured:</h3>
          <pre>
            _bfd_abort sub_bbcc1 sub_e2b51
          </pre>


          <h3>Null pointer dereference:</h3>
          <table style="width:50%">
            <tr>
              <th>Address</th>
              <th>Function</th>
            </tr>
            <tr>
              <td> 0x3524C </td>
              <td> a </td>
            </tr>
            <tr>
              <td> 0x371D0 </td>
              <td> b </td>
            </tr>
            <tr>
              <td> 0x6C41E </td>
              <td> c </td>
            </tr>
          </table>

    </table>
