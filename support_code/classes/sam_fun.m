classdef sam_fun
    methods(Static)
        function dua = dua_fun
            dua = sam;
            dua.sam_idx = "dua";
            dua.n_pla_str = 'eig';
            dua.ani = ["gfa010"; "gfa013"];
            dua.tit = 'dua';
            dua = spe(dua);
        end

        function exp = exp_fun
            exp = sam;
            exp.sam_idx = "exp";
            exp.n_pla_str = 'eig';
            exp.ani = ["esp283"; "esp284"; "esp285"];
            exp.tit = 'exp';
            exp = spe(exp);
        end

        function spo = spo_fun
            spo = sam;
            spo.sam_idx = "spo";
            spo.n_pla_str = 'eig';
            spo.ani = ["esp279"; "esp280"; "esp281"; "esp282"; "esp287"; "esp288"; "esp289"; "esp291"];
            spo.tit = 'spo';
            spo = spe(spo);
        end

        function nuc_axo = nuc_axo_fun
            nuc_axo = sam;
            nuc_axo.sam_idx = "nuc_axo";
            nuc_axo.n_pla_str = 'eig';
            nuc_axo.ani = ["esp269"; "esp270"; "esp271"; "esp272"; "esp273"; "esp275"; "esp276"; ...
                "esp277"; "esp278"];
            nuc_axo.tit = 'nuc_axo';
            nuc_axo.col_sig = 'k';
            nuc_axo.col_dru = 'b';
            nuc_axo.col_sti = 'm';
            nuc_axo.bas_dur_beh = 20.5;
            nuc_axo.res_dur_beh = 20.5;
            nuc_axo.col_rat_ave = 'b';
            nuc_axo.col_sti_ave = 'r';
            nuc_axo.win_siz = 120;
            nuc_axo.win_col = 'myccc';
            nuc_axo.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            nuc_axo.mar = '.';
            nuc_axo.n_par = 5;
            nuc_axo = spe(nuc_axo);
        end

        function gfa = gfa_fun
            gfa = sam;
            gfa.sam_idx = "gfa";
            gfa.n_pla_str = 'eig';
            gfa.ani = ["gfa001"; "gfa002"; "gfa003"; "gfa004"; "gfa005"; "gfa006"; "gfa007"];
            gfa.tit = 'gfa';
            gfa = spe(gfa);
        end

        function g2r = g2r_fun
            g2r = sam;
            g2r.sam_idx = "g2r";
            g2r.n_pla_str = 'one';
            g2r.ani = ["esp264_1"; "esp264_2"; "esp264_3"; "esp264_4"];
            g2r.tit = 'g2r';
            g2r.col_sig = 'k';
            g2r.col_dru = 'b';
            g2r.col_sti = 'm';
            g2r.bas_dur_beh = 20.5;
            g2r.res_dur_beh = 20.5;
            g2r.col_rat_ave = 'b';
            g2r.col_sti_ave = 'r';
            g2r.win_siz = 120;
            g2r.win_col = 'myccc';
            g2r.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            g2r.mar = '.';
            g2r.n_par = 5;
            g2r = spe(g2r);
        end

        function gab = gab_fun
            gab = sam;
            gab.sam_idx = "gab";
            gab.n_pla_str = 'eig';
            gab.ani = ["esp257"; "esp259"; "esp260"; "esp261"; "esp262"; "esp265"; "esp266"; ...
                "esp267"];


            %gab.ani = ["esp257"; "esp258"; "esp259"; "esp260"; "esp261"; "esp262"];

            gab.tit = 'gab';
            gab.col_sig = 'k';
            gab.col_dru = 'b';
            gab.col_sti = 'm';
            gab.bas_dur_beh = 20.5;
            gab.res_dur_beh = 20.5;
            gab.col_rat_ave = 'b';
            gab.col_sti_ave = 'r';
            gab.win_siz = 120;
            gab.win_col = 'myccc';
            gab.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            gab.mar = '.';
            gab.n_par = 5;
            gab = spe(gab);
        end

        function axo_cel = axo_cel_fun
            axo_cel = sam;
            axo_cel.sam_idx = "axo_cel";
            axo_cel.ani = ["esp228"; "esp229"; "esp230"; "esp231"; "esp233"; "esp234"; ...
                "esp235"; "esp237"; "esp238"; "esp239"; "esp240"; "esp241"; "esp242"; "esp243"; ...
                "esp244"; "esp246"; "esp247"];
            axo_cel.tit = 'axo_cel';
            axo_cel.con = ["Low"; "Moderate"; "High"];
            axo_cel.col_sig = 'k';
            axo_cel.col_dru = 'b';
            axo_cel.col_sti = 'm';
            axo_cel.bas_dur_beh = 20.5;
            axo_cel.res_dur_beh = 20.5;
            axo_cel.col_rat_ave = 'b';
            axo_cel.col_sti_ave = 'r';
            axo_cel.win_siz = 120;
            axo_cel.win_col = 'myccc';
            axo_cel.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            axo_cel.mar = '.';
            axo_cel.n_par = 5;
            axo_cel = spe(axo_cel);
        end

        function cel_onl = cel_onl_fun
            cel_onl = sam;
            cel_onl.sam_idx = "cel_onl";
            cel_onl.n_pla_str = 'eig';
            cel_onl.ani = ["esp244"; "esp246"; "esp247"; "esp248"; "esp249"; "esp250"; "esp251"; ...
                "esp252"; "esp253"; "esp254"; "esp255"; "esp256"];
            cel_onl.tit = 'cel_onl';
            cel_onl.col_sig = 'k';
            cel_onl.col_dru = 'b';
            cel_onl.col_sti = 'm';
            cel_onl.bas_dur_beh = 20.5;
            cel_onl.res_dur_beh = 20.5;
            cel_onl.col_rat_ave = 'b';
            cel_onl.col_sti_ave = 'r';
            cel_onl.win_siz = 120;
            cel_onl.win_col = 'myccc';
            cel_onl.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            cel_onl.mar = '.';
            cel_onl.n_par = 5;
            cel_onl = spe(cel_onl);
        end

        function axo_onl = axo_onl_fun
            axo_onl = sam;
            axo_onl.sam_idx = "axo_onl";
            axo_onl.ani = ["esp228"; "esp229"; "esp230"; "esp231"; "esp233"; "esp234"; ...
                "esp235"; "esp237"; "esp238"; "esp239"; "esp240"; "esp241"; "esp242"; "esp243"];
            axo_onl.tit = 'axo_onl';
            axo_onl.col_sig = 'k';
            axo_onl.col_dru = 'b';
            axo_onl.col_sti = 'm';
            axo_onl.bas_dur_beh = 20.5;
            axo_onl.res_dur_beh = 20.5;
            axo_onl.col_rat_ave = 'b';
            axo_onl.col_sti_ave = 'r';
            axo_onl.win_siz = 120;
            axo_onl.win_col = 'myccc';
            axo_onl.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            axo_onl.mar = '.';
            axo_onl.n_par = 5;
            axo_onl = spe(axo_onl);
        end
        
        function axo = axo_fun
            axo = sam;
            axo.sam_idx = "axo";
            axo.n_pla_str = 'eig';
            %axo.ani = ["esp213"; "esp220"; "esp221"; "esp226"; "esp227"];
            axo.ani = ["esp214"; "esp215"; "esp216"; "esp217"; "esp220"; "esp221"; "esp226"; "esp227"];
            axo.tit = 'axo';
            axo.col_sig = 'k';
            axo.col_dru = 'b';
            axo.col_sti = 'm';
            axo.bas_dur_beh = 20.5;
            axo.res_dur_beh = 20.5;
            axo.col_rat_ave = 'b';
            axo.col_sti_ave = 'r';
            axo.win_siz = 120;
            axo.win_col = 'myccc';
            axo.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            axo.mar = '.';
            axo.n_par = 5;
            axo = spe(axo);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function non = non_fun
            non = sam;
            non.sam_idx = "non";
            non.ani = ["esp127"; "esp128"; "esp130"; "esp131"; "esp132"; ...
                "esp133"; "esp136"; "esp137"; "esp138"; "esp139"; "esp140"; "esp141"; ...
                "esp144"; "esp145"; "esp146"; "esp150"; "esp151"; "esp154"; "esp155"; ...
                "esp159"; "esp160"; "esp161"; "esp164"; "esp165"; "esp169"; "esp170"; ...
                "esp171"; "esp173"; "esp174"; "esp176"; "esp177"; "esp181"];
            non.tit = 'non-dmso';
            %non.tit_con = ["tph2 animals sham - low"; "tph2 animals sham - moderate"; ...
            %    "tph2 animals sham - high"];
            non.con = ["Low"; "Moderate"; "High"];
            non.col_sig = 'k';
            non.col_dru = 'b';
            non.col_sti = 'm';
            non.bas_dur_beh = 20.5;
            non.res_dur_beh = 20.5;
            non.col_rat_ave = 'b';
            non.col_sti_ave = 'r';
            non.win_siz = 120;
            non.win_col = 'myccc';
            non.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            non.mar = '.';
            non.mar_siz = 20;
            non.n_par = 5;
            %non.fil_pat_mul_sam = "X:\kadiram\Data\Pooled\rap\rap.mat";
            non = spe(non);
        end
        
        function dms = dms_fun
            dms = sam;
            dms.sam_idx = "dms";
            dms.ani = ["esp184"; ...
                "esp185"; "esp186"; "esp190"; "esp191"; "esp192"; "esp193"; "esp196"; ...
                "esp197"; "esp200"; "esp201"];
            dms.tit = 'dmso';
            %dms.tit_con = ["Control animals for tph2 - low"; "Control animals for tph2 - moderate"; 
            % "Control animals for tph2 - high"];
            dms.con = ["Low"; "Moderate"; "High"];
            dms.col_sig = 'k';
            dms.col_dru = 'b';
            dms.col_sti = 'm';
            dms.bas_dur_beh = 20.5;
            dms.res_dur_beh = 20.5;
            dms.col_rat_ave = 'b';
            dms.col_sti_ave = 'r';
            dms.win_siz = 120;
            dms.win_col = 'myccc';
            %dms.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', 
            % 'Mouth rate (Hz)', 'Eye rate (Hz)'};
            dms.mar = '.';
            dms.mar_siz = 20;
            dms.n_par = 5;
            %dms.fil_pat_mul_sam = "X:\kadiram\Data\Pooled\rap\rap.mat";
            dms = spe(dms);
        end
        
        function jrg_tph = jrg_tph_fun
            jrg_tph = sam;
            jrg_tph.sam_idx = "jrg_tph";
            jrg_tph.ani = ["esp204"; "esp204_abv"; "esp204_bel"; ...
                "esp205"; "esp205_las"; "esp205_mid"];
            jrg_tph.tit = 'jRGECO1b tph2';
            jrg_tph.tit_con = ["jRGECO1b tph2 animals - low"; ...
                "jRGECO1b tph2 animals - moderate"; ...
                "jRGECO1b tph2 animals - high"];
            jrg_tph.con = ["Low"; "Moderate"; "High"];
            jrg_tph.col_sig = 'k';
            jrg_tph.col_dru = 'b';
            jrg_tph.col_sti = 'm';
            jrg_tph.bas_dur_beh = 20.5;
            jrg_tph.res_dur_beh = 20.5;
            jrg_tph.col_rat_ave = 'b';
            jrg_tph.col_sti_ave = 'r';
            jrg_tph.win_siz = 120;
            jrg_tph.win_col = 'myccc';
            jrg_tph.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            jrg_tph.mar = '.';
            jrg_tph.mar_siz = 20;
            jrg_tph.n_par = 5;
            jrg_tph = spe(jrg_tph);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tph2
        function con_tai = con_tai_fun
            con_tai = sam;
            con_tai.sam_idx = "con_tai";
            con_tai.ani = ["esp097"; "esp098"; "esp099"; "esp101"; "esp102"; "esp103"; "esp112"; ...
                "esp113"; "esp114"; "esp116"; "esp117"; "esp118"; "esp120"; "esp121"; "esp122"; ...
                "esp124"; "esp125"; "esp126"];
            con_tai.tit = 'HuC MTZ';
            con_tai = spe(con_tai);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function tph_sha_bri = tph_sha_bri_fun
            tph_sha_bri = sam;
            tph_sha_bri.sam_idx = "tph_sha_bri";
            tph_sha_bri.ani = ["esp161"; "esp164"; "esp165"; "esp169"; "esp185"];
            tph_sha_bri.tit = 'tph2 sham';
            tph_sha_bri = spe(tph_sha_bri);
        end

        function tph_sha_hig = tph_sha_hig_fun
            tph_sha_hig = sam;
            tph_sha_hig.sam_idx = "tph_sha_hig";
            tph_sha_hig.ani = ["esp164"; "esp165"; "esp169"; "esp185"];
            tph_sha_hig.tit = 'tph2 sham';
            tph_sha_hig = spe(tph_sha_hig);
        end

        function con_low = con_low_fun
            con_low = sam;
            con_low.sam_idx = "con_low";
            con_low.ani = ["esp099"; "esp113"];
            con_low.tit = 'HuC MTZ';
            con_low = spe(con_low);
        end

        function tph_hig = tph_hig_fun
            tph_hig = sam;
            tph_hig.sam_idx = "tph_hig";
            tph_hig.ani = ["esp109"; "esp157"; "esp158"; "esp162"; "esp163"];
            tph_hig.tit = 'tph2 MTZ';
            tph_hig = spe(tph_hig);
        end

        function tph_sha_abl = tph_sha_abl_fun
            tph_sha_abl = sam;
            tph_sha_abl.sam_idx = "tph_sha_abl";
            tph_sha_abl.ani = ["esp161"; "esp164"; "esp165"; "esp169"; "esp170"; "esp174"; "esp177"; ...
                "esp181"; "esp185"; "esp186"; "esp190"; "esp191"; "esp192"; "esp193"; "esp196"; ...
                "esp200"; ...
                "esp092"; "esp105"; "esp109"; "esp157"; "esp158"; "esp162"; "esp163"; "esp187"; ...
                "esp188"; "esp189"; "esp194"; "esp195"; "esp198"; "esp199"; "esp202"; "esp203"];
            tph_sha_abl = spe(tph_sha_abl);
        end

        function tph_sha = tph_sha_fun
            tph_sha = sam;
            tph_sha.sam_idx = "tph_sha";
            tph_sha.ani = ["esp161"; "esp164"; "esp165"; "esp169"; "esp170"; "esp174"; "esp177"; ...
                "esp181"; "esp185"; "esp186"; "esp190"; "esp191"; "esp192"; "esp193"; "esp196"; ...
                "esp200"];
            tph_sha.tit = 'tph2 sham';
            tph_sha.tit_con = ["tph2 animals sham - low"; "tph2 animals sham - moderate"; ...
                "tph2 animals sham - high"];
            tph_sha.col_sig = 'k';
            tph_sha.col_dru = 'b';
            tph_sha.col_sti = 'm';
            tph_sha.bas_dur_beh = 20.5;
            tph_sha.res_dur_beh = 20.5;
            tph_sha.col_rat_ave = 'b';
            tph_sha.col_sti_ave = 'r';
            tph_sha.win_siz = 120;
            tph_sha.win_col = 'myccc';
            tph_sha.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            tph_sha.mar = '.';
            tph_sha.n_par = 5;
            tph_sha.fil_pat_mul_sam = "X:\kadiram\Data\Pooled\rap\rap.mat";
            tph_sha = spe(tph_sha);
        end
        
        function con_for_tph = con_for_tph_fun
            con_for_tph = sam;
            con_for_tph.sam_idx = "con_for_tph";
            con_for_tph.ani = ["esp097"; "esp098"; "esp099"; "esp101"; "esp113"];
            con_for_tph.tit = 'HuC MTZ';
            con_for_tph.tit_con = ["Control animals for tph2 - low"; ...
                "Control animals for tph2 - moderate"; "Control animals for tph2 - high"];
            con_for_tph.col_sig = 'k';
            con_for_tph.col_dru = 'b';
            con_for_tph.col_sti = 'm';
            con_for_tph.bas_dur_beh = 20.5;
            con_for_tph.res_dur_beh = 20.5;
            con_for_tph.col_rat_ave = 'b';
            con_for_tph.col_sti_ave = 'r';
            con_for_tph.win_siz = 120;
            con_for_tph.win_col = 'myccc';
            con_for_tph.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            con_for_tph.mar = '.';
            con_for_tph.n_par = 5;
            con_for_tph.fil_pat_mul_sam = "X:\kadiram\Data\Pooled\rap\rap.mat";
            con_for_tph = spe(con_for_tph);
        end
        
        function tph = tph_fun
            tph = sam;
            tph.sam_idx = "tph";
            tph.ani = ["esp092"; "esp105"; "esp109"; "esp157"; "esp158"; "esp162"; "esp163"; ...
                "esp187"; "esp188"; "esp189"; "esp194"; "esp195"; "esp198"; "esp199"; "esp202"; ...
                "esp203"];
            tph.tit = 'tph2 MTZ';
            tph.tit_con = ["tph2 animals tap 3V"; "tph2 animals tap 6V"; ...
                "tph2 animals tap 12V"];
            tph.col_sig = 'k';
            tph.col_dru = 'b';
            tph.col_sti = 'm';
            tph.bas_dur_beh = 20.5;
            tph.res_dur_beh = 20.5;
            tph.col_rat_ave = 'b';
            tph.col_sti_ave = 'r';
            tph.win_siz = 120;
            tph.win_col = 'myccc';
            tph.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            tph.mar = '.';
            tph.n_par = 5;
            tph.fil_pat_mul_sam = "X:\kadiram\Data\Pooled\rap\rap.mat";
            tph = spe(tph);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% drugs
        function sha = sha_fun
            sha = sam;
            sha.sam_idx = "sha";
            sha.con = ["3V"; "6V"; "12V"];
            sha.ani = ["esp064"; "esp065"; "esp067"; "esp068"; "esp070"; "esp071"; "esp072"];
            sha.col_sig = 'k';
            sha.col_dru = 'b';
            sha.col_sti = 'm';
            sha.tit = 'Sham';
            sha.bas_dur_beh = 20.5;
            sha.res_dur_beh = 20.5;
            sha.col_rat_ave = 'b';
            sha.col_sti_ave = 'r';
            sha.tit_con = ["Sham animals tap 3V"; "Sham animals tap 6V"; "Sham animals tap 12V"];
            sha.win_siz = 120;
            sha.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', ...
                'Mouth rate (Hz)', 'Eye rate (Hz)'};
            sha.mar = '.';
            sha.n_par = 5;
            sha = spe(sha);
        end
        
        function bus = bus_fun
            bus = sam;
            bus.sam_idx = "bus";
            bus.ani = ["esp076"; "esp078"; "esp079"; "esp086"];
            bus.tit = 'Buspirone';
            bus.tit_con = ["Buspirone animals tap 3V"; "Buspirone animals tap 6V"; "Buspirone animals tap 12V"];
            bus.con = ["3V"; "6V"; "12V"];
            bus.col_sig = 'k';
            bus.col_dru = 'b';
            bus.col_sti = 'm';
            bus.bas_dur_beh = 20.5;
            bus.res_dur_beh = 20.5;
            bus.col_rat_ave = 'b';
            bus.col_sti_ave = 'r';
            bus.win_siz = 120;
            bus.win_col = 'myccc';
            bus.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', 'Mouth rate (Hz)', 'Eye rate (Hz)'};
            bus.mar = '.';
            bus.mar_siz = 20;
            bus.n_par = 5;
            bus = spe(bus);
        end
        
        function for_dru = for_fun
            for_dru = sam;
            for_dru.sam_idx = "for";
            for_dru.ani = ["esp077"; "esp081"; "esp082"; "esp083"; "esp084"];
            for_dru.tit = 'Forskolin';
            for_dru.tit_con = ["Forskolin animals tap 3V"; "Forskolin animals tap 6V"; "Forskolin animals tap 12V"];
            for_dru.con = ["3V"; "6V"; "12V"];
            for_dru.col_sig = 'k';
            for_dru.col_dru = 'b';
            for_dru.col_sti = 'm';
            for_dru.bas_dur_beh = 20.5;
            for_dru.res_dur_beh = 20.5;
            for_dru.col_rat_ave = 'b';
            for_dru.col_sti_ave = 'r';
            for_dru.win_siz = 120;
            for_dru.win_col = 'myccc';
            for_dru.y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', 'Mouth rate (Hz)', 'Eye rate (Hz)'};
            for_dru.mar = '.';
            for_dru.mar_siz = 20;
            for_dru.n_par = 5;
            for_dru = spe(for_dru);
        end
    end
end