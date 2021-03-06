__kernel void RunAutomata(const int ySize, __global int* a, __global int* c)
{
    unsigned int i = get_global_id(0);
	unsigned int j = get_global_id(1);
	unsigned int my_id = i + ySize*j;
	unsigned int count = 0;	

	if(a[my_id - 1] == 1) {count += 1;}
	if(a[my_id + 1] == 1) {count += 1;}
	if(a[my_id - 1 - ySize] == 1) {count += 1;}
	if(a[my_id - 1 + ySize] == 1) {count += 1;}
	if(a[my_id + 1 - ySize] == 1) {count += 1;}
	if(a[my_id + 1 + ySize] == 1) {count += 1;}
	if(a[my_id - ySize] == 1) {count += 1;}
	if(a[my_id + ySize] == 1) {count += 1;}

	c[my_id] = (count == 3) || (count == 2) && (a[my_id] != 0);

}
