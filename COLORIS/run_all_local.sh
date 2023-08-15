make clean
uclid clr_base.ucl > clr_base.proof
echo -e "This is proof for base cases" >> all.proof
cat clr_base.proof >> all.proof

uclid clr_self.ucl >clr_self.proof
echo -e "\n\nThis is proof for attacker inductive" >> all.proof
cat clr_self.proof >> all.proof

uclid clr_other.ucl >clr_other.proof
echo -e "\n\nThis is proof for non-attacker inductiveness" >> all.proof
cat clr_other.proof >> all.proof

uclid clr_non.ucl >clr_non.proof
echo -e "\n\nThis is proof for non-interference" >> all.proof
cat clr_non.proof >> all.proof