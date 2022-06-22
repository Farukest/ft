i=0
while [ $i -ne 3 ]
do
		i=$(($i+1))
		if pgrep lora_pkt_fwd$i
		then 
			echo "ALREADY RUNNING";
		else
			echo "STARTING BECAUSE IT HAS STOPPED - "pgrep lora_pkt_fwd$i;			
			echo "$i"
			cd /home/ft/packet_ft_$i/ && make -f Makefile
			cd /home/ft/packet_ft_$i/packet_forwarder/ && ./lora_pkt_fwd$i &
			sleep $((20*($i)))
		fi       
		
done
