


src_data_name = "gcc_O0_source"
tgt_data_name = "gcc_O0_target"

total_src_dir = "./compiler_dataset/"+src_data_name+".txt"
total_tgt_dir = "./compiler_dataset/"+tgt_data_name+".txt"

code_txt = open(total_src_dir, encoding='utf-8').read().split('\n')
summ_txt = open(total_tgt_dir, encoding='utf-8').read().split('\n')

function_name = 'c islower'
temp = list()
for c, s in zip(code_txt, summ_txt):
    if s == function_name:
        temp.append(c)

with open("./is_duplicated/"+function_name+"_body", mode='w', encoding='utf-8') as out:
    for t in temp:
        out.write(t+'\n')