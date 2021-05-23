#ifndef LIBASM_H
#define LIBASM_H

#include <stddef.h>

ssize_t ft_read(int fd, void* buf, size_t len);
int ft_strcmp(const char* s1, const char* s2);
char* ft_strcpy(char* dst, const char* src);
char* ft_strdup(const char* s);
size_t ft_strlen(const char* s);
ssize_t ft_write(int fd, const void* buf, size_t len);

#ifdef BONUS

#include "ft_list.h"

int ft_atoi_base(char* str, char* base);
void ft_list_push_front(t_list** head, void* data);
void ft_list_remove_if(t_list** head, void* data_ref, int (*cmp)());
int ft_list_size(t_list* head);
void ft_list_sort(t_list** head, int (*cmp)());

#endif // BONUS

#endif // LIBASM_H
