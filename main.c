#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

#include "libasm.h"

int main() {
    char b1[3000];
    char b2[30];

    const char* s1 = "";
    const char* s2 = "first\0second";
    const char* s3 = "The unicorn lived in a lilac wood...";
    const char* s4 = "The unicorn lived in a lilac wood, and she lived all alone. She was very old, though she did not"
         "know it, and she was no longer the careless color of sea foam, but rather the color of snow falling on a"
         "moonlit night. But her eyes were still clear and unwearied, and she still moved like a shadow on the sea.\n"
         "She did not look anything like a horned horse, as unicorns are often pictured, being smaller and cloven-hoofed,"
         "and possessing that oldest, wildest grace that horses have never had, that deer have only in a shy, thin"
         "imitation and goats in dancing mockery. Her neck was long and slender, making her head seem smaller than it"
         "was, and the mane that fell almost to the middle of her back was as soft as dandelion fluff and as fine as"
         "cirrus. She had pointed ears and thin legs, with feathers of white hair at the ankles, and the long horn"
         "above her eyes shone and shivered with its own seashell light even in the deepest midnight. She had killed"
         "dragons with it, and healed a king whose poisoned wound would not close, and knocked down ripe chestnuts"
         "for bear cubs.\nUnicorns are immortal. It is their nature to live alone in one place: usually a forest where"
         "there is a pool clear enough for them to see themselves for they are a little vain, knowing themselves to be"
         "the most beautiful creatures in all the world, and magic besides. They mate very rarely, and no place is"
         "more enchanted than one where a unicorn has been born. The last time she had seen another unicorn the young"
         "virgins who still came seeking her now and then had called to her in a different tongue, but then, she had"
         "no idea of months and years and centuries, or even of seasons. It was always spring in her forest, because"
         "she lived there, and she wandered all day among the great beech trees, keeping watch over the animals that"
         "lived in the ground and under bushes, in nests and caves, earths and treetops. Generation after generation,"
         "wolves and rabbits alike, they hunted and loved and had children and died, and as the unicorn did none of"
         "these things, she never grew tired of watching them.";


    printf("%s\n", " \x1b[0;46m-- strlen\x1b[0m");
    printf("%s\n", " \x1b[36mTest 1\x1b[0m");
    printf("sys = |%ld|\n", strlen(s1));
    printf("ft_ = |%ld|\n", ft_strlen(s1));
    printf("%s\n", " \x1b[36mTest 2\x1b[0m");
    printf("sys = |%ld|\n", strlen(s2));
    printf("ft_ = |%ld|\n", ft_strlen(s2));
    printf("%s\n", " \x1b[36mTest 3\x1b[0m");
    printf("sys = |%ld|\n", strlen(s3));
    printf("ft_ = |%ld|\n", ft_strlen(s3));
    printf("%s\n", " \x1b[36mTest 4\x1b[0m");
    printf("sys = |%ld|\n", strlen(s4));
    printf("ft_ = |%ld|\n", ft_strlen(s4));
    printf("\n");


    printf("%s\n", " \x1b[0;46m-- strcpy\x1b[0m");
    printf("%s\n", " \x1b[36mTest 1\x1b[0m");
    printf("sys = |%s|\n", strcpy(b1, s1));
    printf("ft_ = |%s|\n", ft_strcpy(b1, s1));
    printf("%s\n", " \x1b[36mTest 2\x1b[0m");
    printf("sys = |%s|\n", strcpy(b1, s2));
    printf("ft_ = |%s|\n", ft_strcpy(b1, s2));
    printf("%s\n", " \x1b[36mTest 3\x1b[0m");
    printf("sys = |%s|\n", strcpy(b1, s4));
    printf("ft_ = |%s|\n", ft_strcpy(b1, s4));
    printf("\n");


    printf("%s\n", " \x1b[0;46m-- strcmp\x1b[0m");
    printf("%s\n", " \x1b[36mTest 1\x1b[0m");
    printf("sys = |%d|\n", strcmp(s1, s3));
    printf("ft_ = |%d|\n", ft_strcmp(s1, s3));
    printf("%s\n", " \x1b[36mTest 2\x1b[0m");
    printf("sys = |%d|\n", strcmp(s3, s1));
    printf("ft_ = |%d|\n", ft_strcmp(s3, s1));
    printf("%s\n", " \x1b[36mTest 3\x1b[0m");
    printf("sys = |%d|\n", strcmp(s1, s1));
    printf("ft_ = |%d|\n", ft_strcmp(s1, s1));
    printf("%s\n", " \x1b[36mTest 4\x1b[0m");
    printf("sys = |%d|\n", strcmp(s4, s4));
    printf("ft_ = |%d|\n", ft_strcmp(s4, s4));
    printf("%s\n", " \x1b[36mTest 5\x1b[0m");
    printf("sys = |%d|\n", strcmp(s3, s3));
    printf("ft_ = |%d|\n", ft_strcmp(s3, s3));
    printf("%s\n", " \x1b[36mTest 6\x1b[0m");
    printf("sys = |%d|\n", strcmp(s3, s4));
    printf("ft_ = |%d|\n", ft_strcmp(s3, s4));
    printf("%s\n", " \x1b[36mTest 7\x1b[0m");
    printf("sys = |%d|\n", strcmp(s4, s3));
    printf("ft_ = |%d|\n", ft_strcmp(s4, s3));
    printf("%s\n", " \x1b[36mTest 8\x1b[0m");
    printf("sys = |%d|\n", strcmp(s2, s2));
    printf("ft_ = |%d|\n", ft_strcmp(s2, s2));
    printf("\n");


    printf("%s\n", " \x1b[0;46m-- strdup\x1b[0m");
    printf("%s\n", " \x1b[36mTest 1\x1b[0m");
    char* dup = strdup(s1);
    printf("sys = |%s|\n", dup);
    free(dup);
    dup = ft_strdup(s1);
    printf("ft_ = |%s|\n", dup);
    free(dup);
    printf("\n");
    printf("%s\n", " \x1b[36mTest 2\x1b[0m");
    dup = strdup(s2);
    printf("sys = |%s|\n", dup);
    free(dup);
    dup = ft_strdup(s2);
    printf("ft_ = |%s|\n", dup);
    free(dup);
    printf("\n");
    printf("%s\n", " \x1b[36mTest 3\x1b[0m");
    dup = strdup(s4);
    printf("sys = |%s|\n", dup);
    free(dup);
    dup = ft_strdup(s4);
    printf("ft_ = |%s|\n", dup);
    free(dup);
    printf("\n");


    printf("%s\n", " \x1b[0;46m-- write\x1b[0m");
    printf("%s\n", " \x1b[36mTest 1\x1b[0m");
    printf("sys = |%ld|\n", write(STDOUT_FILENO, s1, strlen(s1)));
    printf("sys = |%s|\n", strerror(errno));
    errno = 0;
    printf("ft_ = |%ld|\n", ft_write(STDOUT_FILENO, s1, ft_strlen(s1)));
    printf("ft_ = |%s|\n", strerror(errno));
    errno = 0;
    printf("%s\n", " \x1b[36mTest 2\x1b[0m");
    printf("\nsys = |%ld|\n", write(STDOUT_FILENO, s2, strlen(s2)));
    printf("sys = |%s|\n", strerror(errno));
    errno = 0;
    printf("\nft_ = |%ld|\n", ft_write(STDOUT_FILENO, s2, ft_strlen(s2)));
    printf("ft_ = |%s|\n", strerror(errno));
    errno = 0;
    printf("%s\n", " \x1b[36mTest 3\x1b[0m");
    printf("\nsys = |%ld|\n", write(STDOUT_FILENO, s3, strlen(s3)));
    printf("sys = |%s|\n", strerror(errno));
    errno = 0;
    printf("\nft_ = |%ld|\n", ft_write(STDOUT_FILENO, s3, ft_strlen(s3)));
    printf("ft_ = |%s|\n", strerror(errno));
    errno = 0;
    printf("%s\n", " \x1b[36mTest 4\x1b[0m");
    int fd1 = open("kek.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);
    printf("sys = |%ld|\n", write(fd1, s4, ft_strlen(s4)));
    printf("sys = |%s|\n", strerror(errno));
    close(fd1);
    errno = 0;
    fd1 = open("ft_kek.txt", O_CREAT | O_WRONLY | O_TRUNC, 0644);
    printf("ft_ = |%ld|\n", ft_write(fd1, s4, ft_strlen(s4)));
    printf("ft_ = |%s|\n", strerror(errno));
    close(fd1);
    errno = 0;
    printf("%s\n", " \x1b[36mTest 5\x1b[0m");
    printf("sys = |%ld|\n", write(21, s4, ft_strlen(s4)));
    printf("sys = |%s|\n", strerror(errno));
    errno = 0;
    printf("ft_ = |%ld|\n", ft_write(21, s4, ft_strlen(s4)));
    printf("ft_ = |%s|\n", strerror(errno));
    errno = 0;
    printf("\n");

    printf("%s\n", " \x1b[0;46m-- read\x1b[0m");
    printf("%s\n", " \x1b[36mTest 1\x1b[0m");
    ssize_t ret = read(STDIN_FILENO, b1, 3000);
    b1[ret] = '\0';
    printf("\nsys = |%ld|\n", ret);
    printf("sys = |%s|\n", b1);
    printf("sys = |%s|\n", strerror(errno));
    errno = 0;
    ret = ft_read(STDIN_FILENO, b1, 3000);
    b1[ret] = '\0';
    printf("\nft_ = |%ld|\n", ret);
    printf("ft_ = |%s|\n", b1);
    printf("ft_ = |%s|\n", strerror(errno));
    errno = 0;
    printf("%s\n", " \x1b[36mTest 2\x1b[0m");
    int fd2 = open("src/ft_read.s", O_RDONLY);
    printf("sys = |%ld|\n", read(fd2, b2, 10));
    b2[10] = '\0';
    printf("sys = |%s|\n", b2);
    printf("sys = |%s|\n", strerror(errno));
    close(fd2);
    errno = 0;
    fd2 = open("src/ft_read.s", O_RDONLY);
    printf("ft_ = |%ld|\n", ft_read(fd2, b2, 10));
    b2[10] = '\0';
    printf("ft_ = |%s|\n", b2);
    printf("ft_ = |%s|\n", strerror(errno));
    close(fd2);
    errno = 0;
    printf("%s\n", " \x1b[36mTest 3\x1b[0m");
    printf("sys = |%ld|\n", read(21, b2, 10));
    printf("sys = |%s|\n", b2);
    printf("sys = |%s|\n", strerror(errno));
    errno = 0;
    printf("ft_ = |%ld|\n", ft_read(21, b2, 10));
    printf("ft_ = |%s|\n", b2);
    printf("ft_ = |%s|\n", strerror(errno));
    errno = 0;
    printf("\n");

#ifdef BONUS

#include "ft_list.h"

    t_list* list = NULL;

    printf("Initial size = %d\n\n", ft_list_size(list));

    ft_list_push_front(&list, strdup("aa"));
    ft_list_push_front(&list, strdup("ccc"));
    ft_list_push_front(&list, strdup("yyyyyy"));


    printf("Added three elements, size = %d\n", ft_list_size(list));

    ft_list_push_front(&list, strdup("yyyyyy"));
    ft_list_push_front(&list, strdup("zz"));
    ft_list_push_front(&list, strdup("x"));
    ft_list_push_front(&list, strdup("yyyyyy"));

    printf("Added four more elements, size = %d\n", ft_list_size(list));

    printf("\nList contents: ");
    for (t_list* node = list; node != NULL; node = node->next) {
        printf("%s ", node->data);
    }
    printf("\n\n");

    printf("Sorting list\n");
    ft_list_sort(&list, strcmp);

    printf("\nList contents: ");
    for (t_list* node = list; node != NULL; node = node->next) {
        printf("%s ", node->data);
    }
    printf("\n\n");

    printf("Remove \"yyyyyy\"\n");

    ft_list_remove_if(&list, "yyyyyy", strcmp);

    printf("Removed three elements, size = %d\n", ft_list_size(list));

    printf("\nList contents: ");
    for (t_list* node = list; node != NULL; node = node->next) {
        printf("%s ", node->data);
    }
    printf("\n\n");

    printf("ft_atoi_base(123, 2) = %d\n", ft_atoi_base("123", "2"));
    printf("ft_atoi_base(123, 314) = %d\n", ft_atoi_base("123", "314"));
    printf("ft_atoi_base(44431, 314) = %d\n", ft_atoi_base("44431", "314"));
    printf("ft_atoi_base(42, -=12312sdfs) = %d\n", ft_atoi_base("42", "-=12312sdfs"));

#endif

}
