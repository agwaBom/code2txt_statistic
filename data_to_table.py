def data_length_to_list(text_list):
    data_length_list = list()
    for line in text_list:
        data_length_list.append(len(line.split()))
    return data_length_list

for i in range(0, 4):
    src_data_name = "gcc_O"+str(i)+"_source"
    tgt_data_name = "gcc_O"+str(i)+"_target"

    total_src_dir = "./compiler_dataset/"+src_data_name+".txt"
    total_tgt_dir = "./compiler_dataset/"+tgt_data_name+".txt"

    code_txt = open(total_src_dir, encoding='utf-8').read().split('\n')
    summ_txt = open(total_tgt_dir, encoding='utf-8').read().split('\n')

    code_len_list = data_length_to_list(code_txt)
    text_len_list = data_length_to_list(summ_txt)

    with open("./"+src_data_name+"_len_list.csv", mode="w", encoding='utf-8') as out:
        for i in code_len_list:
            out.write(str(i)+",")

    with open("./"+tgt_data_name+"_len_list.csv", mode="w", encoding='utf-8') as out:
        for i in text_len_list:
            out.write(str(i)+",")
