SELECT          A.CASENO, A.uid, C.cname, A.SDATE, A.OD_idx, A.rid, D.l08
FROM              dbo.tbl_opd_order AS A LEFT OUTER JOIN
                            dbo.tbl_lab_record AS B ON A.CASENO = B.CASENO AND A.OD_idx = B.OD_idx LEFT OUTER JOIN
                            dbo.tbl_patients AS C ON A.uid = C.uid LEFT OUTER JOIN
                            dbo.p_lab AS D ON A.rid = D.rid
WHERE          (A.CLASS = '¿À≈Á') AND (A.rid NOT IN ('L-Cho', 'L-VAL', 'L-Li', 'L-Carb', 'L-P100', 'L-TM-F', 'L-TM-M')) AND 
                            (B.CASENO IS NULL) and A.uid='H101270237'


