//*************************** IO PAD IN ********************************
if(blk_name.entries(bl)=='pad_in')  then 
    fd_io= mopen (fname+'.pads','a+');  // DEDICATED PADS code
    for ss=1:scs_m.objs(bl).model.ipar(1)
        tmp_pad = strsplit(iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries," ")
//disp(iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries)
        if tmp_pad(3) == '3'  | tmp_pad(3)== '5' then tmp_pad(3) = '1';
        elseif tmp_pad(3) == '2' then tmp_pad(3) = '0';
        end 
        netout = 'net';
        if tmp_pad(4)=='#int[5]'|tmp_pad(4)=='#int[4]'|tmp_pad(4)=='#int[3]'|tmp_pad(4)=='#int[2]'|tmp_pad(4)=='#int[1]'|tmp_pad(4)=='#int[0]' then
if(board_num==2)
            if((iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries=="13 0 1 #int[1]")&(ramp_chk==1)&(sft_chk==1))
	    //mputl(netout+ string(blk(blk_objs(bl),2+numofip)) + "_" + string(ss) + ' ' +"13 0 4 #int[4]",fd_io)
	    mputl("",fd_io)
            else 	 
            mputl(netout+ string(blk(blk_objs(bl),2+numofip)) + "_" + string(ss) + ' ' + iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries,fd_io);
            end
elseif(board_num==3)
            if((iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries=="0 12 5 #int[5]")&(ramp_chk==1)&(sft_chk==1))
	    //mputl(netout+ string(blk(blk_objs(bl),2+numofip)) + "_" + string(ss) + ' ' +"13 0 4 #int[4]",fd_io)
	    mputl("",fd_io)
            else 	 
            mputl(netout+ string(blk(blk_objs(bl),2+numofip)) + "_" + string(ss) + ' ' + iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries,fd_io);
            end
end
        else 
            mputl(netout+ string(blk(blk_objs(bl),2+numofip)) + "_" + string(ss) + ' ' + iopad_loc(loc_num,scs_m.objs(blk_objs(bl)).model.rpar(ss)).entries + 'tgate[' + tmp_pad(3)+ ']',fd_io);
        end
    end
    mclose(fd_io);
end
