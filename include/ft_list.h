#ifndef FT_LIST_H
#define FT_LIST_H

struct s_list {
    void* data;
    struct s_list* next;
};

typedef struct s_list t_list;

#endif
