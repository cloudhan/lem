(defpackage :lem-lisp-mode/hyperspec
  (:use :cl :lem))

(in-package :lem-lisp-mode/hyperspec)

(defparameter *hyperspec-root* "http://www.lispworks.com/reference/HyperSpec/"
  "The root of the Common Lisp HyperSpec URL. 
It can also be a path to load it locally:
`file://usr/local/doc/HyperSpec/`.")

(defparameter *symbols-list*
  '(("&allow-other-keys" "03_da.htm")
    ("&aux" "03_da.htm")
    ("&body" "03_dd.htm")
    ("&environment" "03_dd.htm")
    ("&key" "03_da.htm")
    ("&optional" "03_da.htm")
    ("&rest" "03_da.htm")
    ("&whole" "03_dd.htm")
    ("*" "a_st.htm")
    ("**" "v__stst_.htm")
    ("***" "v__stst_.htm")
    ("*break-on-signals*" "v_break_.htm")
    ("*compile-file-pathname*" "v_cmp_fi.htm")
    ("*compile-file-truename*" "v_cmp_fi.htm")
    ("*compile-print*" "v_cmp_pr.htm")
    ("*compile-verbose*" "v_cmp_pr.htm")
    ("*debug-io*" "v_debug_.htm")
    ("*debugger-hook*" "v_debugg.htm")
    ("*default-pathname-defaults*" "v_defaul.htm")
    ("*error-output*" "v_debug_.htm")
    ("*features*" "v_featur.htm")
    ("*gensym-counter*" "v_gensym.htm")
    ("*load-pathname*" "v_ld_pns.htm")
    ("*load-print*" "v_ld_prs.htm")
    ("*load-truename*" "v_ld_pns.htm")
    ("*load-verbose*" "v_ld_prs.htm")
    ("*macroexpand-hook*" "v_mexp_h.htm")
    ("*modules*" "v_module.htm")
    ("*package*" "v_pkg.htm")
    ("*print-array*" "v_pr_ar.htm")
    ("*print-base*" "v_pr_bas.htm")
    ("*print-case*" "v_pr_cas.htm")
    ("*print-circle*" "v_pr_cir.htm")
    ("*print-escape*" "v_pr_esc.htm")
    ("*print-gensym*" "v_pr_gen.htm")
    ("*print-length*" "v_pr_lev.htm")
    ("*print-level*" "v_pr_lev.htm")
    ("*print-lines*" "v_pr_lin.htm")
    ("*print-miser-width*" "v_pr_mis.htm")
    ("*print-pprint-dispatch*" "v_pr_ppr.htm")
    ("*print-pretty*" "v_pr_pre.htm")
    ("*print-radix*" "v_pr_bas.htm")
    ("*print-readably*" "v_pr_rda.htm")
    ("*print-right-margin*" "v_pr_rig.htm")
    ("*query-io*" "v_debug_.htm")
    ("*random-state*" "v_rnd_st.htm")
    ("*read-base*" "v_rd_bas.htm")
    ("*read-default-float-format*" "v_rd_def.htm")
    ("*read-eval*" "v_rd_eva.htm")
    ("*read-suppress*" "v_rd_sup.htm")
    ("*readtable*" "v_rdtabl.htm")
    ("*standard-input*" "v_debug_.htm")
    ("*standard-output*" "v_debug_.htm")
    ("*terminal-io*" "v_termin.htm")
    ("*trace-output*" "v_debug_.htm")
    ("+" "a_pl.htm")
    ("++" "v_pl_plp.htm")
    ("+++" "v_pl_plp.htm")
    ("-" "a__.htm")
    ("/" "a_sl.htm")
    ("//" "v_sl_sls.htm")
    ("///" "v_sl_sls.htm")
    ("/=" "f_eq_sle.htm")
    ("1+" "f_1pl_1_.htm")
    ("1-" "f_1pl_1_.htm")
    ("<" "f_eq_sle.htm")
    ("<=" "f_eq_sle.htm")
    ("=" "f_eq_sle.htm")
    (">" "f_eq_sle.htm")
    (">=" "f_eq_sle.htm")
    ("abort" "a_abort.htm")
    ("abs" "f_abs.htm")
    ("acons" "f_acons.htm")
    ("acos" "f_asin_.htm")
    ("acosh" "f_sinh_.htm")
    ("add-method" "f_add_me.htm")
    ("adjoin" "f_adjoin.htm")
    ("adjust-array" "f_adjust.htm")
    ("adjustable-array-p" "f_adju_1.htm")
    ("allocate-instance" "f_alloca.htm")
    ("alpha-char-p" "f_alpha_.htm")
    ("alphanumericp" "f_alphan.htm")
    ("and" "a_and.htm")
    ("append" "f_append.htm")
    ("apply" "f_apply.htm")
    ("apropos" "f_apropo.htm")
    ("apropos-list" "f_apropo.htm")
    ("aref" "f_aref.htm")
    ("arithmetic-error" "e_arithm.htm")
    ("arithmetic-error-operands" "f_arithm.htm")
    ("arithmetic-error-operation" "f_arithm.htm")
    ("array" "t_array.htm")
    ("array-dimension" "f_ar_dim.htm")
    ("array-dimension-limit" "v_ar_dim.htm")
    ("array-dimensions" "f_ar_d_1.htm")
    ("array-displacement" "f_ar_dis.htm")
    ("array-element-type" "f_ar_ele.htm")
    ("array-has-fill-pointer-p" "f_ar_has.htm")
    ("array-in-bounds-p" "f_ar_in_.htm")
    ("array-rank" "f_ar_ran.htm")
    ("array-rank-limit" "v_ar_ran.htm")
    ("array-row-major-index" "f_ar_row.htm")
    ("array-total-size" "f_ar_tot.htm")
    ("array-total-size-limit" "v_ar_tot.htm")
    ("arrayp" "f_arrayp.htm")
    ("ash" "f_ash.htm")
    ("asin" "f_asin_.htm")
    ("asinh" "f_sinh_.htm")
    ("assert" "m_assert.htm")
    ("assoc" "f_assocc.htm")
    ("assoc-if" "f_assocc.htm")
    ("assoc-if-not" "f_assocc.htm")
    ("atan" "f_asin_.htm")
    ("atanh" "f_sinh_.htm")
    ("atom" "a_atom.htm")
    ("base-char" "t_base_c.htm")
    ("base-string" "t_base_s.htm")
    ("bignum" "t_bignum.htm")
    ("bit" "a_bit.htm")
    ("bit-and" "f_bt_and.htm")
    ("bit-andc1" "f_bt_and.htm")
    ("bit-andc2" "f_bt_and.htm")
    ("bit-eqv" "f_bt_and.htm")
    ("bit-ior" "f_bt_and.htm")
    ("bit-nand" "f_bt_and.htm")
    ("bit-nor" "f_bt_and.htm")
    ("bit-not" "f_bt_and.htm")
    ("bit-orc1" "f_bt_and.htm")
    ("bit-orc2" "f_bt_and.htm")
    ("bit-vector" "t_bt_vec.htm")
    ("bit-vector-p" "f_bt_vec.htm")
    ("bit-xor" "f_bt_and.htm")
    ("block" "s_block.htm")
    ("boole" "f_boole.htm")
    ("boole-1" "v_b_1_b.htm")
    ("boole-2" "v_b_1_b.htm")
    ("boole-and" "v_b_1_b.htm")
    ("boole-andc1" "v_b_1_b.htm")
    ("boole-andc2" "v_b_1_b.htm")
    ("boole-c1" "v_b_1_b.htm")
    ("boole-c2" "v_b_1_b.htm")
    ("boole-clr" "v_b_1_b.htm")
    ("boole-eqv" "v_b_1_b.htm")
    ("boole-ior" "v_b_1_b.htm")
    ("boole-nand" "v_b_1_b.htm")
    ("boole-nor" "v_b_1_b.htm")
    ("boole-orc1" "v_b_1_b.htm")
    ("boole-orc2" "v_b_1_b.htm")
    ("boole-set" "v_b_1_b.htm")
    ("boole-xor" "v_b_1_b.htm")
    ("boolean" "t_ban.htm")
    ("both-case-p" "f_upper_.htm")
    ("boundp" "f_boundp.htm")
    ("break" "f_break.htm")
    ("broadcast-stream" "t_broadc.htm")
    ("broadcast-stream-streams" "f_broadc.htm")
    ("built-in-class" "t_built_.htm")
    ("butlast" "f_butlas.htm")
    ("byte" "f_by_by.htm")
    ("byte-position" "f_by_by.htm")
    ("byte-size" "f_by_by.htm")
    ("caaaar" "f_car_c.htm")
    ("caaadr" "f_car_c.htm")
    ("caaar" "f_car_c.htm")
    ("caadar" "f_car_c.htm")
    ("caaddr" "f_car_c.htm")
    ("caadr" "f_car_c.htm")
    ("caar" "f_car_c.htm")
    ("cadaar" "f_car_c.htm")
    ("cadadr" "f_car_c.htm")
    ("cadar" "f_car_c.htm")
    ("caddar" "f_car_c.htm")
    ("cadddr" "f_car_c.htm")
    ("caddr" "f_car_c.htm")
    ("cadr" "f_car_c.htm")
    ("call-arguments-limit" "v_call_a.htm")
    ("call-method" "m_call_m.htm")
    ("call-next-method" "f_call_n.htm")
    ("car" "f_car_c.htm")
    ("case" "m_case_.htm")
    ("catch" "s_catch.htm")
    ("ccase" "m_case_.htm")
    ("cdaaar" "f_car_c.htm")
    ("cdaadr" "f_car_c.htm")
    ("cdaar" "f_car_c.htm")
    ("cdadar" "f_car_c.htm")
    ("cdaddr" "f_car_c.htm")
    ("cdadr" "f_car_c.htm")
    ("cdar" "f_car_c.htm")
    ("cddaar" "f_car_c.htm")
    ("cddadr" "f_car_c.htm")
    ("cddar" "f_car_c.htm")
    ("cdddar" "f_car_c.htm")
    ("cddddr" "f_car_c.htm")
    ("cdddr" "f_car_c.htm")
    ("cddr" "f_car_c.htm")
    ("cdr" "f_car_c.htm")
    ("ceiling" "f_floorc.htm")
    ("cell-error" "e_cell_e.htm")
    ("cell-error-name" "f_cell_e.htm")
    ("cerror" "f_cerror.htm")
    ("change-class" "f_chg_cl.htm")
    ("char" "f_char_.htm")
    ("char-code" "f_char_c.htm")
    ("char-code-limit" "v_char_c.htm")
    ("char-downcase" "f_char_u.htm")
    ("char-equal" "f_chareq.htm")
    ("char-greaterp" "f_chareq.htm")
    ("char-int" "f_char_i.htm")
    ("char-lessp" "f_chareq.htm")
    ("char-name" "f_char_n.htm")
    ("char-not-equal" "f_chareq.htm")
    ("char-not-greaterp" "f_chareq.htm")
    ("char-not-lessp" "f_chareq.htm")
    ("char-upcase" "f_char_u.htm")
    ("char/=" "f_chareq.htm")
    ("char<" "f_chareq.htm")
    ("char<=" "f_chareq.htm")
    ("char=" "f_chareq.htm")
    ("char>" "f_chareq.htm")
    ("char>=" "f_chareq.htm")
    ("character" "a_ch.htm")
    ("characterp" "f_chp.htm")
    ("check-type" "m_check_.htm")
    ("cis" "f_cis.htm")
    ("class" "t_class.htm")
    ("class-name" "f_class_.htm")
    ("class-of" "f_clas_1.htm")
    ("clear-input" "f_clear_.htm")
    ("clear-output" "f_finish.htm")
    ("close" "f_close.htm")
    ("clrhash" "f_clrhas.htm")
    ("code-char" "f_code_c.htm")
    ("coerce" "f_coerce.htm")
    ("compilation-speed" "d_optimi.htm")
    ("compile" "f_cmp.htm")
    ("compile-file" "f_cmp_fi.htm")
    ("compile-file-pathname" "f_cmp__1.htm")
    ("compiled-function" "t_cmpd_f.htm")
    ("compiled-function-p" "f_cmpd_f.htm")
    ("compiler-macro" "f_docume.htm")
    ("compiler-macro-function" "f_cmp_ma.htm")
    ("complement" "f_comple.htm")
    ("complex" "a_comple.htm")
    ("complexp" "f_comp_3.htm")
    ("compute-applicable-methods" "f_comput.htm")
    ("compute-restarts" "f_comp_1.htm")
    ("concatenate" "f_concat.htm")
    ("concatenated-stream" "t_concat.htm")
    ("concatenated-stream-streams" "f_conc_1.htm")
    ("cond" "m_cond.htm")
    ("condition" "e_cnd.htm")
    ("conjugate" "f_conjug.htm")
    ("cons" "a_cons.htm")
    ("consp" "f_consp.htm")
    ("constantly" "f_cons_1.htm")
    ("constantp" "f_consta.htm")
    ("continue" "a_contin.htm")
    ("control-error" "e_contro.htm")
    ("copy-alist" "f_cp_ali.htm")
    ("copy-list" "f_cp_lis.htm")
    ("copy-pprint-dispatch" "f_cp_ppr.htm")
    ("copy-readtable" "f_cp_rdt.htm")
    ("copy-seq" "f_cp_seq.htm")
    ("copy-structure" "f_cp_stu.htm")
    ("copy-symbol" "f_cp_sym.htm")
    ("copy-tree" "f_cp_tre.htm")
    ("cos" "f_sin_c.htm")
    ("cosh" "f_sinh_.htm")
    ("count" "f_countc.htm")
    ("count-if" "f_countc.htm")
    ("count-if-not" "f_countc.htm")
    ("ctypecase" "m_tpcase.htm")
    ("debug" "d_optimi.htm")
    ("decf" "m_incf_.htm")
    ("declaim" "m_declai.htm")
    ("declaration" "d_declar.htm")
    ("declare" "s_declar.htm")
    ("decode-float" "f_dec_fl.htm")
    ("decode-universal-time" "f_dec_un.htm")
    ("defclass" "m_defcla.htm")
    ("defconstant" "m_defcon.htm")
    ("defgeneric" "m_defgen.htm")
    ("define-compiler-macro" "m_define.htm")
    ("define-condition" "m_defi_5.htm")
    ("define-method-combination" "m_defi_4.htm")
    ("define-modify-macro" "m_defi_2.htm")
    ("define-setf-expander" "m_defi_3.htm")
    ("define-symbol-macro" "m_defi_1.htm")
    ("defmacro" "m_defmac.htm")
    ("defmethod" "m_defmet.htm")
    ("defpackage" "m_defpkg.htm")
    ("defparameter" "m_defpar.htm")
    ("defsetf" "m_defset.htm")
    ("defstruct" "m_defstr.htm")
    ("deftype" "m_deftp.htm")
    ("defun" "m_defun.htm")
    ("defvar" "m_defpar.htm")
    ("delete" "f_rm_rm.htm")
    ("delete-duplicates" "f_rm_dup.htm")
    ("delete-file" "f_del_fi.htm")
    ("delete-if" "f_rm_rm.htm")
    ("delete-if-not" "f_rm_rm.htm")
    ("delete-package" "f_del_pk.htm")
    ("denominator" "f_numera.htm")
    ("deposit-field" "f_deposi.htm")
    ("describe" "f_descri.htm")
    ("describe-object" "f_desc_1.htm")
    ("destructuring-bind" "m_destru.htm")
    ("digit-char" "f_digit_.htm")
    ("digit-char-p" "f_digi_1.htm")
    ("directory" "f_dir.htm")
    ("directory-namestring" "f_namest.htm")
    ("disassemble" "f_disass.htm")
    ("division-by-zero" "e_divisi.htm")
    ("do" "m_do_do.htm")
    ("do*" "m_do_do.htm")
    ("do-all-symbols" "m_do_sym.htm")
    ("do-external-symbols" "m_do_sym.htm")
    ("do-symbols" "m_do_sym.htm")
    ("documentation" "f_docume.htm")
    ("dolist" "m_dolist.htm")
    ("dotimes" "m_dotime.htm")
    ("double-float" "t_short_.htm")
    ("double-float-epsilon" "v_short_.htm")
    ("double-float-negative-epsilon" "v_short_.htm")
    ("dpb" "f_dpb.htm")
    ("dribble" "f_dribbl.htm")
    ("dynamic-extent" "d_dynami.htm")
    ("ecase" "m_case_.htm")
    ("echo-stream" "t_echo_s.htm")
    ("echo-stream-input-stream" "f_echo_s.htm")
    ("echo-stream-output-stream" "f_echo_s.htm")
    ("ed" "f_ed.htm")
    ("eighth" "f_firstc.htm")
    ("elt" "f_elt.htm")
    ("encode-universal-time" "f_encode.htm")
    ("end-of-file" "e_end_of.htm")
    ("endp" "f_endp.htm")
    ("enough-namestring" "f_namest.htm")
    ("ensure-directories-exist" "f_ensu_1.htm")
    ("ensure-generic-function" "f_ensure.htm")
    ("eq" "f_eq.htm")
    ("eql" "a_eql.htm")
    ("equal" "f_equal.htm")
    ("equalp" "f_equalp.htm")
    ("error" "a_error.htm")
    ("etypecase" "m_tpcase.htm")
    ("eval" "f_eval.htm")
    ("eval-when" "s_eval_w.htm")
    ("evenp" "f_evenpc.htm")
    ("every" "f_everyc.htm")
    ("exp" "f_exp_e.htm")
    ("export" "f_export.htm")
    ("expt" "f_exp_e.htm")
    ("extended-char" "t_extend.htm")
    ("fboundp" "f_fbound.htm")
    ("fceiling" "f_floorc.htm")
    ("fdefinition" "f_fdefin.htm")
    ("ffloor" "f_floorc.htm")
    ("fifth" "f_firstc.htm")
    ("file-author" "f_file_a.htm")
    ("file-error" "e_file_e.htm")
    ("file-error-pathname" "f_file_e.htm")
    ("file-length" "f_file_l.htm")
    ("file-namestring" "f_namest.htm")
    ("file-position" "f_file_p.htm")
    ("file-stream" "t_file_s.htm")
    ("file-string-length" "f_file_s.htm")
    ("file-write-date" "f_file_w.htm")
    ("fill" "f_fill.htm")
    ("fill-pointer" "f_fill_p.htm")
    ("find" "f_find_.htm")
    ("find-all-symbols" "f_find_a.htm")
    ("find-class" "f_find_c.htm")
    ("find-if" "f_find_.htm")
    ("find-if-not" "f_find_.htm")
    ("find-method" "f_find_m.htm")
    ("find-package" "f_find_p.htm")
    ("find-restart" "f_find_r.htm")
    ("find-symbol" "f_find_s.htm")
    ("finish-output" "f_finish.htm")
    ("first" "f_firstc.htm")
    ("fixnum" "t_fixnum.htm")
    ("flet" "s_flet_.htm")
    ("float" "a_float.htm")
    ("float-digits" "f_dec_fl.htm")
    ("float-precision" "f_dec_fl.htm")
    ("float-radix" "f_dec_fl.htm")
    ("float-sign" "f_dec_fl.htm")
    ("floating-point-inexact" "e_floa_1.htm")
    ("floating-point-invalid-operation" "e_floati.htm")
    ("floating-point-overflow" "e_floa_2.htm")
    ("floating-point-underflow" "e_floa_3.htm")
    ("floatp" "f_floatp.htm")
    ("floor" "f_floorc.htm")
    ("fmakunbound" "f_fmakun.htm")
    ("force-output" "f_finish.htm")
    ("format" "f_format.htm")
    ("formatter" "m_format.htm")
    ("fourth" "f_firstc.htm")
    ("fresh-line" "f_terpri.htm")
    ("fround" "f_floorc.htm")
    ("ftruncate" "f_floorc.htm")
    ("ftype" "d_ftype.htm")
    ("funcall" "f_funcal.htm")
    ("function" "a_fn.htm")
    ("function-keywords" "f_fn_kwd.htm")
    ("function-lambda-expression" "f_fn_lam.htm")
    ("functionp" "f_fnp.htm")
    ("gcd" "f_gcd.htm")
    ("generic-function" "t_generi.htm")
    ("gensym" "f_gensym.htm")
    ("gentemp" "f_gentem.htm")
    ("get" "f_get.htm")
    ("get-decoded-time" "f_get_un.htm")
    ("get-dispatch-macro-character" "f_set__1.htm")
    ("get-internal-real-time" "f_get_in.htm")
    ("get-internal-run-time" "f_get__1.htm")
    ("get-macro-character" "f_set_ma.htm")
    ("get-output-stream-string" "f_get_ou.htm")
    ("get-properties" "f_get_pr.htm")
    ("get-setf-expansion" "f_get_se.htm")
    ("get-universal-time" "f_get_un.htm")
    ("getf" "f_getf.htm")
    ("gethash" "f_gethas.htm")
    ("go" "s_go.htm")
    ("graphic-char-p" "f_graphi.htm")
    ("handler-bind" "m_handle.htm")
    ("handler-case" "m_hand_1.htm")
    ("hash-table" "t_hash_t.htm")
    ("hash-table-count" "f_hash_1.htm")
    ("hash-table-p" "f_hash_t.htm")
    ("hash-table-rehash-size" "f_hash_2.htm")
    ("hash-table-rehash-threshold" "f_hash_3.htm")
    ("hash-table-size" "f_hash_4.htm")
    ("hash-table-test" "f_hash_5.htm")
    ("host-namestring" "f_namest.htm")
    ("identity" "f_identi.htm")
    ("if" "s_if.htm")
    ("ignorable" "d_ignore.htm")
    ("ignore" "d_ignore.htm")
    ("ignore-errors" "m_ignore.htm")
    ("imagpart" "f_realpa.htm")
    ("import" "f_import.htm")
    ("in-package" "m_in_pkg.htm")
    ("incf" "m_incf_.htm")
    ("initialize-instance" "f_init_i.htm")
    ("inline" "d_inline.htm")
    ("input-stream-p" "f_in_stm.htm")
    ("inspect" "f_inspec.htm")
    ("integer" "t_intege.htm")
    ("integer-decode-float" "f_dec_fl.htm")
    ("integer-length" "f_intege.htm")
    ("integerp" "f_inte_1.htm")
    ("interactive-stream-p" "f_intera.htm")
    ("intern" "f_intern.htm")
    ("internal-time-units-per-second" "v_intern.htm")
    ("intersection" "f_isec_.htm")
    ("invalid-method-error" "f_invali.htm")
    ("invoke-debugger" "f_invoke.htm")
    ("invoke-restart" "f_invo_1.htm")
    ("invoke-restart-interactively" "f_invo_2.htm")
    ("isqrt" "f_sqrt_.htm")
    ("keyword" "t_kwd.htm")
    ("keywordp" "f_kwdp.htm")
    ("labels" "s_flet_.htm")
    ("lambda" "a_lambda.htm")
    ("lambda-list-keywords" "v_lambda.htm")
    ("lambda-parameters-limit" "v_lamb_1.htm")
    ("last" "f_last.htm")
    ("lcm" "f_lcm.htm")
    ("ldb" "f_ldb.htm")
    ("ldb-test" "f_ldb_te.htm")
    ("ldiff" "f_ldiffc.htm")
    ("least-negative-double-float" "v_most_1.htm")
    ("least-negative-long-float" "v_most_1.htm")
    ("least-negative-normalized-double-float" "v_most_1.htm")
    ("least-negative-normalized-long-float" "v_most_1.htm")
    ("least-negative-normalized-short-float" "v_most_1.htm")
    ("least-negative-normalized-single-float" "v_most_1.htm")
    ("least-negative-short-float" "v_most_1.htm")
    ("least-negative-single-float" "v_most_1.htm")
    ("least-positive-double-float" "v_most_1.htm")
    ("least-positive-long-float" "v_most_1.htm")
    ("least-positive-normalized-double-float" "v_most_1.htm")
    ("least-positive-normalized-long-float" "v_most_1.htm")
    ("least-positive-normalized-short-float" "v_most_1.htm")
    ("least-positive-normalized-single-float" "v_most_1.htm")
    ("least-positive-short-float" "v_most_1.htm")
    ("least-positive-single-float" "v_most_1.htm")
    ("length" "f_length.htm")
    ("let" "s_let_l.htm")
    ("let*" "s_let_l.htm")
    ("lisp-implementation-type" "f_lisp_i.htm")
    ("lisp-implementation-version" "f_lisp_i.htm")
    ("list" "a_list.htm")
    ("list*" "f_list_.htm")
    ("list-all-packages" "f_list_a.htm")
    ("list-length" "f_list_l.htm")
    ("listen" "f_listen.htm")
    ("listp" "f_listp.htm")
    ("load" "f_load.htm")
    ("load-logical-pathname-translations" "f_ld_log.htm")
    ("load-time-value" "s_ld_tim.htm")
    ("locally" "s_locall.htm")
    ("log" "f_log.htm")
    ("logand" "f_logand.htm")
    ("logandc1" "f_logand.htm")
    ("logandc2" "f_logand.htm")
    ("logbitp" "f_logbtp.htm")
    ("logcount" "f_logcou.htm")
    ("logeqv" "f_logand.htm")
    ("logical-pathname" "a_logica.htm")
    ("logical-pathname-translations" "f_logica.htm")
    ("logior" "f_logand.htm")
    ("lognand" "f_logand.htm")
    ("lognor" "f_logand.htm")
    ("lognot" "f_logand.htm")
    ("logorc1" "f_logand.htm")
    ("logorc2" "f_logand.htm")
    ("logtest" "f_logtes.htm")
    ("logxor" "f_logand.htm")
    ("long-float" "t_short_.htm")
    ("long-float-epsilon" "v_short_.htm")
    ("long-float-negative-epsilon" "v_short_.htm")
    ("long-site-name" "f_short_.htm")
    ("loop" "m_loop.htm")
    ("loop-finish" "m_loop_f.htm")
    ("lower-case-p" "f_upper_.htm")
    ("machine-instance" "f_mach_i.htm")
    ("machine-type" "f_mach_t.htm")
    ("machine-version" "f_mach_v.htm")
    ("macro-function" "f_macro_.htm")
    ("macroexpand" "f_mexp_.htm")
    ("macroexpand-1" "f_mexp_.htm")
    ("macrolet" "s_flet_.htm")
    ("make-array" "f_mk_ar.htm")
    ("make-broadcast-stream" "f_mk_bro.htm")
    ("make-concatenated-stream" "f_mk_con.htm")
    ("make-condition" "f_mk_cnd.htm")
    ("make-dispatch-macro-character" "f_mk_dis.htm")
    ("make-echo-stream" "f_mk_ech.htm")
    ("make-hash-table" "f_mk_has.htm")
    ("make-instance" "f_mk_ins.htm")
    ("make-instances-obsolete" "f_mk_i_1.htm")
    ("make-list" "f_mk_lis.htm")
    ("make-load-form" "f_mk_ld_.htm")
    ("make-load-form-saving-slots" "f_mk_l_1.htm")
    ("make-method" "m_call_m.htm")
    ("make-package" "f_mk_pkg.htm")
    ("make-pathname" "f_mk_pn.htm")
    ("make-random-state" "f_mk_rnd.htm")
    ("make-sequence" "f_mk_seq.htm")
    ("make-string" "f_mk_stg.htm")
    ("make-string-input-stream" "f_mk_s_1.htm")
    ("make-string-output-stream" "f_mk_s_2.htm")
    ("make-symbol" "f_mk_sym.htm")
    ("make-synonym-stream" "f_mk_syn.htm")
    ("make-two-way-stream" "f_mk_two.htm")
    ("makunbound" "f_makunb.htm")
    ("map" "f_map.htm")
    ("map-into" "f_map_in.htm")
    ("mapc" "f_mapc_.htm")
    ("mapcan" "f_mapc_.htm")
    ("mapcar" "f_mapc_.htm")
    ("mapcon" "f_mapc_.htm")
    ("maphash" "f_maphas.htm")
    ("mapl" "f_mapc_.htm")
    ("maplist" "f_mapc_.htm")
    ("mask-field" "f_mask_f.htm")
    ("max" "f_max_m.htm")
    ("member" "a_member.htm")
    ("member-if" "f_mem_m.htm")
    ("member-if-not" "f_mem_m.htm")
    ("merge" "f_merge.htm")
    ("merge-pathnames" "f_merge_.htm")
    ("method" "t_method.htm")
    ("method-combination" "a_method.htm")
    ("method-combination-error" "f_meth_1.htm")
    ("method-qualifiers" "f_method.htm")
    ("min" "f_max_m.htm")
    ("minusp" "f_minusp.htm")
    ("mismatch" "f_mismat.htm")
    ("mod" "a_mod.htm")
    ("most-negative-double-float" "v_most_1.htm")
    ("most-negative-fixnum" "v_most_p.htm")
    ("most-negative-long-float" "v_most_1.htm")
    ("most-negative-short-float" "v_most_1.htm")
    ("most-negative-single-float" "v_most_1.htm")
    ("most-positive-double-float" "v_most_1.htm")
    ("most-positive-fixnum" "v_most_p.htm")
    ("most-positive-long-float" "v_most_1.htm")
    ("most-positive-short-float" "v_most_1.htm")
    ("most-positive-single-float" "v_most_1.htm")
    ("muffle-warning" "a_muffle.htm")
    ("multiple-value-bind" "m_multip.htm")
    ("multiple-value-call" "s_multip.htm")
    ("multiple-value-list" "m_mult_1.htm")
    ("multiple-value-prog1" "s_mult_1.htm")
    ("multiple-value-setq" "m_mult_2.htm")
    ("multiple-values-limit" "v_multip.htm")
    ("name-char" "f_name_c.htm")
    ("namestring" "f_namest.htm")
    ("nbutlast" "f_butlas.htm")
    ("nconc" "f_nconc.htm")
    ("next-method-p" "f_next_m.htm")
    ("nil" "a_nil.htm")
    ("nintersection" "f_isec_.htm")
    ("ninth" "f_firstc.htm")
    ("no-applicable-method" "f_no_app.htm")
    ("no-next-method" "f_no_nex.htm")
    ("not" "a_not.htm")
    ("notany" "f_everyc.htm")
    ("notevery" "f_everyc.htm")
    ("notinline" "d_inline.htm")
    ("nreconc" "f_revapp.htm")
    ("nreverse" "f_revers.htm")
    ("nset-difference" "f_set_di.htm")
    ("nset-exclusive-or" "f_set_ex.htm")
    ("nstring-capitalize" "f_stg_up.htm")
    ("nstring-downcase" "f_stg_up.htm")
    ("nstring-upcase" "f_stg_up.htm")
    ("nsublis" "f_sublis.htm")
    ("nsubst" "f_substc.htm")
    ("nsubst-if" "f_substc.htm")
    ("nsubst-if-not" "f_substc.htm")
    ("nsubstitute" "f_sbs_s.htm")
    ("nsubstitute-if" "f_sbs_s.htm")
    ("nsubstitute-if-not" "f_sbs_s.htm")
    ("nth" "f_nth.htm")
    ("nth-value" "m_nth_va.htm")
    ("nthcdr" "f_nthcdr.htm")
    ("null" "a_null.htm")
    ("number" "t_number.htm")
    ("numberp" "f_nump.htm")
    ("numerator" "f_numera.htm")
    ("nunion" "f_unionc.htm")
    ("oddp" "f_evenpc.htm")
    ("open" "f_open.htm")
    ("open-stream-p" "f_open_s.htm")
    ("optimize" "d_optimi.htm")
    ("or" "a_or.htm")
    ("otherwise" "m_case_.htm")
    ("output-stream-p" "f_in_stm.htm")
    ("package" "t_pkg.htm")
    ("package-error" "e_pkg_er.htm")
    ("package-error-package" "f_pkg_er.htm")
    ("package-name" "f_pkg_na.htm")
    ("package-nicknames" "f_pkg_ni.htm")
    ("package-shadowing-symbols" "f_pkg_sh.htm")
    ("package-use-list" "f_pkg_us.htm")
    ("package-used-by-list" "f_pkg__1.htm")
    ("packagep" "f_pkgp.htm")
    ("pairlis" "f_pairli.htm")
    ("parse-error" "e_parse_.htm")
    ("parse-integer" "f_parse_.htm")
    ("parse-namestring" "f_pars_1.htm")
    ("pathname" "a_pn.htm")
    ("pathname-device" "f_pn_hos.htm")
    ("pathname-directory" "f_pn_hos.htm")
    ("pathname-host" "f_pn_hos.htm")
    ("pathname-match-p" "f_pn_mat.htm")
    ("pathname-name" "f_pn_hos.htm")
    ("pathname-type" "f_pn_hos.htm")
    ("pathname-version" "f_pn_hos.htm")
    ("pathnamep" "f_pnp.htm")
    ("peek-char" "f_peek_c.htm")
    ("phase" "f_phase.htm")
    ("pi" "v_pi.htm")
    ("plusp" "f_minusp.htm")
    ("pop" "m_pop.htm")
    ("position" "f_pos_p.htm")
    ("position-if" "f_pos_p.htm")
    ("position-if-not" "f_pos_p.htm")
    ("pprint" "f_wr_pr.htm")
    ("pprint-dispatch" "f_ppr_di.htm")
    ("pprint-exit-if-list-exhausted" "m_ppr_ex.htm")
    ("pprint-fill" "f_ppr_fi.htm")
    ("pprint-indent" "f_ppr_in.htm")
    ("pprint-linear" "f_ppr_fi.htm")
    ("pprint-logical-block" "m_ppr_lo.htm")
    ("pprint-newline" "f_ppr_nl.htm")
    ("pprint-pop" "m_ppr_po.htm")
    ("pprint-tab" "f_ppr_ta.htm")
    ("pprint-tabular" "f_ppr_fi.htm")
    ("prin1" "f_wr_pr.htm")
    ("prin1-to-string" "f_wr_to_.htm")
    ("princ" "f_wr_pr.htm")
    ("princ-to-string" "f_wr_to_.htm")
    ("print" "f_wr_pr.htm")
    ("print-not-readable" "e_pr_not.htm")
    ("print-not-readable-object" "f_pr_not.htm")
    ("print-object" "f_pr_obj.htm")
    ("print-unreadable-object" "m_pr_unr.htm")
    ("probe-file" "f_probe_.htm")
    ("proclaim" "f_procla.htm")
    ("prog" "m_prog_.htm")
    ("prog*" "m_prog_.htm")
    ("prog1" "m_prog1c.htm")
    ("prog2" "m_prog1c.htm")
    ("progn" "s_progn.htm")
    ("program-error" "e_progra.htm")
    ("progv" "s_progv.htm")
    ("provide" "f_provid.htm")
    ("psetf" "m_setf_.htm")
    ("psetq" "m_psetq.htm")
    ("push" "m_push.htm")
    ("pushnew" "m_pshnew.htm")
    ("quote" "s_quote.htm")
    ("random" "f_random.htm")
    ("random-state" "t_rnd_st.htm")
    ("random-state-p" "f_rnd_st.htm")
    ("rassoc" "f_rassoc.htm")
    ("rassoc-if" "f_rassoc.htm")
    ("rassoc-if-not" "f_rassoc.htm")
    ("ratio" "t_ratio.htm")
    ("rational" "a_ration.htm")
    ("rationalize" "f_ration.htm")
    ("rationalp" "f_rati_1.htm")
    ("read" "f_rd_rd.htm")
    ("read-byte" "f_rd_by.htm")
    ("read-char" "f_rd_cha.htm")
    ("read-char-no-hang" "f_rd_c_1.htm")
    ("read-delimited-list" "f_rd_del.htm")
    ("read-from-string" "f_rd_fro.htm")
    ("read-line" "f_rd_lin.htm")
    ("read-preserving-whitespace" "f_rd_rd.htm")
    ("read-sequence" "f_rd_seq.htm")
    ("reader-error" "e_rder_e.htm")
    ("readtable" "t_rdtabl.htm")
    ("readtable-case" "f_rdtabl.htm")
    ("readtablep" "f_rdta_1.htm")
    ("real" "t_real.htm")
    ("realp" "f_realp.htm")
    ("realpart" "f_realpa.htm")
    ("reduce" "f_reduce.htm")
    ("reinitialize-instance" "f_reinit.htm")
    ("rem" "f_mod_r.htm")
    ("remf" "m_remf.htm")
    ("remhash" "f_remhas.htm")
    ("remove" "f_rm_rm.htm")
    ("remove-duplicates" "f_rm_dup.htm")
    ("remove-if" "f_rm_rm.htm")
    ("remove-if-not" "f_rm_rm.htm")
    ("remove-method" "f_rm_met.htm")
    ("remprop" "f_rempro.htm")
    ("rename-file" "f_rn_fil.htm")
    ("rename-package" "f_rn_pkg.htm")
    ("replace" "f_replac.htm")
    ("require" "f_provid.htm")
    ("rest" "f_rest.htm")
    ("restart" "t_rst.htm")
    ("restart-bind" "m_rst_bi.htm")
    ("restart-case" "m_rst_ca.htm")
    ("restart-name" "f_rst_na.htm")
    ("return" "m_return.htm")
    ("return-from" "s_ret_fr.htm")
    ("revappend" "f_revapp.htm")
    ("reverse" "f_revers.htm")
    ("room" "f_room.htm")
    ("rotatef" "m_rotate.htm")
    ("round" "f_floorc.htm")
    ("row-major-aref" "f_row_ma.htm")
    ("rplaca" "f_rplaca.htm")
    ("rplacd" "f_rplaca.htm")
    ("safety" "d_optimi.htm")
    ("satisfies" "t_satisf.htm")
    ("sbit" "f_bt_sb.htm")
    ("scale-float" "f_dec_fl.htm")
    ("schar" "f_char_.htm")
    ("search" "f_search.htm")
    ("second" "f_firstc.htm")
    ("sequence" "t_seq.htm")
    ("serious-condition" "e_seriou.htm")
    ("set" "f_set.htm")
    ("set-difference" "f_set_di.htm")
    ("set-dispatch-macro-character" "f_set__1.htm")
    ("set-exclusive-or" "f_set_ex.htm")
    ("set-macro-character" "f_set_ma.htm")
    ("set-pprint-dispatch" "f_set_pp.htm")
    ("set-syntax-from-char" "f_set_sy.htm")
    ("setf" "a_setf.htm")
    ("setq" "s_setq.htm")
    ("seventh" "f_firstc.htm")
    ("shadow" "f_shadow.htm")
    ("shadowing-import" "f_shdw_i.htm")
    ("shared-initialize" "f_shared.htm")
    ("shiftf" "m_shiftf.htm")
    ("short-float" "t_short_.htm")
    ("short-float-epsilon" "v_short_.htm")
    ("short-float-negative-epsilon" "v_short_.htm")
    ("short-site-name" "f_short_.htm")
    ("signal" "f_signal.htm")
    ("signed-byte" "t_sgn_by.htm")
    ("signum" "f_signum.htm")
    ("simple-array" "t_smp_ar.htm")
    ("simple-base-string" "t_smp_ba.htm")
    ("simple-bit-vector" "t_smp_bt.htm")
    ("simple-bit-vector-p" "f_smp_bt.htm")
    ("simple-condition" "e_smp_cn.htm")
    ("simple-condition-format-arguments" "f_smp_cn.htm")
    ("simple-condition-format-control" "f_smp_cn.htm")
    ("simple-error" "e_smp_er.htm")
    ("simple-string" "t_smp_st.htm")
    ("simple-string-p" "f_smp_st.htm")
    ("simple-type-error" "e_smp_tp.htm")
    ("simple-vector" "t_smp_ve.htm")
    ("simple-vector-p" "f_smp_ve.htm")
    ("simple-warning" "e_smp_wa.htm")
    ("sin" "f_sin_c.htm")
    ("single-float" "t_short_.htm")
    ("single-float-epsilon" "v_short_.htm")
    ("single-float-negative-epsilon" "v_short_.htm")
    ("sinh" "f_sinh_.htm")
    ("sixth" "f_firstc.htm")
    ("sleep" "f_sleep.htm")
    ("slot-boundp" "f_slt_bo.htm")
    ("slot-exists-p" "f_slt_ex.htm")
    ("slot-makunbound" "f_slt_ma.htm")
    ("slot-missing" "f_slt_mi.htm")
    ("slot-unbound" "f_slt_un.htm")
    ("slot-value" "f_slt_va.htm")
    ("software-type" "f_sw_tpc.htm")
    ("software-version" "f_sw_tpc.htm")
    ("some" "f_everyc.htm")
    ("sort" "f_sort_.htm")
    ("space" "d_optimi.htm")
    ("special" "d_specia.htm")
    ("special-operator-p" "f_specia.htm")
    ("speed" "d_optimi.htm")
    ("sqrt" "f_sqrt_.htm")
    ("stable-sort" "f_sort_.htm")
    ("standard" "07_ffb.htm")
    ("standard-char" "t_std_ch.htm")
    ("standard-char-p" "f_std_ch.htm")
    ("standard-class" "t_std_cl.htm")
    ("standard-generic-function" "t_std_ge.htm")
    ("standard-method" "t_std_me.htm")
    ("standard-object" "t_std_ob.htm")
    ("step" "m_step.htm")
    ("storage-condition" "e_storag.htm")
    ("store-value" "a_store_.htm")
    ("stream" "t_stream.htm")
    ("stream-element-type" "f_stm_el.htm")
    ("stream-error" "e_stm_er.htm")
    ("stream-error-stream" "f_stm_er.htm")
    ("stream-external-format" "f_stm_ex.htm")
    ("streamp" "f_stmp.htm")
    ("string" "a_string.htm")
    ("string-capitalize" "f_stg_up.htm")
    ("string-downcase" "f_stg_up.htm")
    ("string-equal" "f_stgeq_.htm")
    ("string-greaterp" "f_stgeq_.htm")
    ("string-left-trim" "f_stg_tr.htm")
    ("string-lessp" "f_stgeq_.htm")
    ("string-not-equal" "f_stgeq_.htm")
    ("string-not-greaterp" "f_stgeq_.htm")
    ("string-not-lessp" "f_stgeq_.htm")
    ("string-right-trim" "f_stg_tr.htm")
    ("string-stream" "t_stg_st.htm")
    ("string-trim" "f_stg_tr.htm")
    ("string-upcase" "f_stg_up.htm")
    ("string/=" "f_stgeq_.htm")
    ("string<" "f_stgeq_.htm")
    ("string<=" "f_stgeq_.htm")
    ("string=" "f_stgeq_.htm")
    ("string>" "f_stgeq_.htm")
    ("string>=" "f_stgeq_.htm")
    ("stringp" "f_stgp.htm")
    ("structure" "f_docume.htm")
    ("structure-class" "t_stu_cl.htm")
    ("structure-object" "t_stu_ob.htm")
    ("style-warning" "e_style_.htm")
    ("sublis" "f_sublis.htm")
    ("subseq" "f_subseq.htm")
    ("subsetp" "f_subset.htm")
    ("subst" "f_substc.htm")
    ("subst-if" "f_substc.htm")
    ("subst-if-not" "f_substc.htm")
    ("substitute" "f_sbs_s.htm")
    ("substitute-if" "f_sbs_s.htm")
    ("substitute-if-not" "f_sbs_s.htm")
    ("subtypep" "f_subtpp.htm")
    ("svref" "f_svref.htm")
    ("sxhash" "f_sxhash.htm")
    ("symbol" "t_symbol.htm")
    ("symbol-function" "f_symb_1.htm")
    ("symbol-macrolet" "s_symbol.htm")
    ("symbol-name" "f_symb_2.htm")
    ("symbol-package" "f_symb_3.htm")
    ("symbol-plist" "f_symb_4.htm")
    ("symbol-value" "f_symb_5.htm")
    ("symbolp" "f_symbol.htm")
    ("synonym-stream" "t_syn_st.htm")
    ("synonym-stream-symbol" "f_syn_st.htm")
    ("t" "a_t.htm")
    ("tagbody" "s_tagbod.htm")
    ("tailp" "f_ldiffc.htm")
    ("tan" "f_sin_c.htm")
    ("tanh" "f_sinh_.htm")
    ("tenth" "f_firstc.htm")
    ("terpri" "f_terpri.htm")
    ("the" "s_the.htm")
    ("third" "f_firstc.htm")
    ("throw" "s_throw.htm")
    ("time" "m_time.htm")
    ("trace" "m_tracec.htm")
    ("translate-logical-pathname" "f_tr_log.htm")
    ("translate-pathname" "f_tr_pn.htm")
    ("tree-equal" "f_tree_e.htm")
    ("truename" "f_tn.htm")
    ("truncate" "f_floorc.htm")
    ("two-way-stream" "t_two_wa.htm")
    ("two-way-stream-input-stream" "f_two_wa.htm")
    ("two-way-stream-output-stream" "f_two_wa.htm")
    ("type" "a_type.htm")
    ("type-error" "e_tp_err.htm")
    ("type-error-datum" "f_tp_err.htm")
    ("type-error-expected-type" "f_tp_err.htm")
    ("type-of" "f_tp_of.htm")
    ("typecase" "m_tpcase.htm")
    ("typep" "f_typep.htm")
    ("unbound-slot" "e_unboun.htm")
    ("unbound-slot-instance" "f_unboun.htm")
    ("unbound-variable" "e_unbo_1.htm")
    ("undefined-function" "e_undefi.htm")
    ("unexport" "f_unexpo.htm")
    ("unintern" "f_uninte.htm")
    ("union" "f_unionc.htm")
    ("unless" "m_when_.htm")
    ("unread-char" "f_unrd_c.htm")
    ("unsigned-byte" "t_unsgn_.htm")
    ("untrace" "m_tracec.htm")
    ("unuse-package" "f_unuse_.htm")
    ("unwind-protect" "s_unwind.htm")
    ("update-instance-for-different-class" "f_update.htm")
    ("update-instance-for-redefined-class" "f_upda_1.htm")
    ("upgraded-array-element-type" "f_upgr_1.htm")
    ("upgraded-complex-part-type" "f_upgrad.htm")
    ("upper-case-p" "f_upper_.htm")
    ("use-package" "f_use_pk.htm")
    ("use-value" "a_use_va.htm")
    ("user-homedir-pathname" "f_user_h.htm")
    ("values" "a_values.htm")
    ("values-list" "f_vals_l.htm")
    ("variable" "f_docume.htm")
    ("vector" "a_vector.htm")
    ("vector-pop" "f_vec_po.htm")
    ("vector-push" "f_vec_ps.htm")
    ("vector-push-extend" "f_vec_ps.htm")
    ("vectorp" "f_vecp.htm")
    ("warn" "f_warn.htm")
    ("warning" "e_warnin.htm")
    ("when" "m_when_.htm")
    ("wild-pathname-p" "f_wild_p.htm")
    ("with-accessors" "m_w_acce.htm")
    ("with-compilation-unit" "m_w_comp.htm")
    ("with-condition-restarts" "m_w_cnd_.htm")
    ("with-hash-table-iterator" "m_w_hash.htm")
    ("with-input-from-string" "m_w_in_f.htm")
    ("with-open-file" "m_w_open.htm")
    ("with-open-stream" "m_w_op_1.htm")
    ("with-output-to-string" "m_w_out_.htm")
    ("with-package-iterator" "m_w_pkg_.htm")
    ("with-simple-restart" "m_w_smp_.htm")
    ("with-slots" "m_w_slts.htm")
    ("with-standard-io-syntax" "m_w_std_.htm")
    ("write" "f_wr_pr.htm")
    ("write-byte" "f_wr_by.htm")
    ("write-char" "f_wr_cha.htm")
    ("write-line" "f_wr_stg.htm")
    ("write-sequence" "f_wr_seq.htm")
    ("write-string" "f_wr_stg.htm")
    ("write-to-string" "f_wr_to_.htm")
    ("y-or-n-p" "f_y_or_n.htm")
    ("yes-or-no-p" "f_y_or_n.htm")
    ("zerop" "f_zerop.htm")))

(defparameter *symbols* (make-hash-table :test 'equal)
  "Maps symbol names to relative urls in the hyperspec.")

(defun hlookup (symbol)
  (unless (> (hash-table-count *symbols*) 0)
    (hload-symbols))

  (let ((symbol-path (gethash symbol *symbols*)))
    (and symbol-path
	 (format nil "~aBody/~a" *hyperspec-root* symbol-path))))

(defun hload-symbols ()
  (when (= (hash-table-count *symbols*) 0)
    (loop for (key path) in *symbols-list*
	  do  (setf (gethash key *symbols*) path))))

(define-command hyperspec-at-point () ()
  (let* ((symbol (symbol-string-at-point (lem:current-point)))
         (url (hlookup symbol)))
    (when (typep url 'lem/thingatp:url)
      (open-external-file url))))

(define-command hyperspec-lookup () ()
  (let* ((symbol-list (mapcar #'car *symbols-list*))
         (symbol (prompt-for-string
                  "Symbol: "
                  :completion-function (lambda (str)
                                         (sort (completion str symbol-list)
                                               #'string-lessp))
                  :test-function (lambda (package)
                                   (find package symbol-list :test #'string-equal))))
         (url (hlookup symbol)))
    (open-external-file url)))
