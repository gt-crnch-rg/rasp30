if [ -e $FPAAHOME/rasp30/remote_server/fpaa_available ]
then
    rm $FPAAHOME/rasp30/remote_server/fpaa_available
    /opt/python3.4/bin/python3.4 $FPAAHOME/rasp30/remote_server/get_email01.py >> $FPAAHOME/Desktop/receive.log 2>&1
    grep -v 'Message can be printed here (Lot of garbage will appear on prompt)' $FPAAHOME/Desktop/receive.log > $FPAAHOME/Desktop/receive_temp.log
    mv $FPAAHOME/Desktop/receive_temp.log $FPAAHOME/Desktop/receive.log
    grep -v 'You have 0 new messages' $FPAAHOME/Desktop/receive.log > $FPAAHOME/Desktop/receive_temp.log
    mv $FPAAHOME/Desktop/receive_temp.log $FPAAHOME/Desktop/receive.log
    touch $FPAAHOME/rasp30/remote_server/fpaa_available
fi
