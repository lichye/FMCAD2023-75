make clean
all_start_time=$SECONDS
start_time=$SECONDS
docker run -it --rm -v ${PWD}:${PWD} -w ${PWD} -u root kkmc/uclid5docker:uclid5_image uclid clr_base.ucl > clr_base.proof
echo -e "This is proof for base cases" >> all.proof
cat clr_base.proof >> all.proof
elapsed=$(( SECONDS - start_time ))
echo "Proof runtime for base case is $elapsed seconds" >> time.log

start_time=$SECONDS
docker run -it --rm -v ${PWD}:${PWD} -w ${PWD} -u root kkmc/uclid5docker:uclid5_image uclid clr_self.ucl > clr_self.proof
echo -e "\n\nThis is proof for attacker inductive" >> all.proof
cat clr_self.proof >> all.proof
elapsed=$(( SECONDS - start_time ))
echo "Proof runtime for attacker inductiveness is $elapsed seconds" >> time.log

start_time=$SECONDS
docker run -it --rm -v ${PWD}:${PWD} -w ${PWD} -u root kkmc/uclid5docker:uclid5_image uclid clr_other.ucl > clr_other.proof
echo -e "This is proof for non-attacker inductiveness: " >> all.proof
cat clr_other.proof >> all.proof
elapsed=$(( SECONDS - start_time ))
echo "Proof runtime for non-attacker inductiveness is $elapsed seconds" >> time.log

start_time=$SECONDS
docker run -it --rm -v ${PWD}:${PWD} -w ${PWD} -u root kkmc/uclid5docker:uclid5_image uclid clr_non.ucl > clr_non.proof
echo -e "\n\nThis is proof for non-interference" >> all.proof
cat clr_non.proof >> all.proof
elapsed=$(( SECONDS - start_time ))
echo "Proof runtime for non-interference step is $elapsed seconds" >> time.log

elapsed=$(( SECONDS - all_start_time ))
echo "Total runtime is $elapsed seconds" >> time.log
