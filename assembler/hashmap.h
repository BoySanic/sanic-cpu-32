#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Linked List node
struct node {
  char *key;
  struct Opcode *value;
  struct node *next;
};

struct hashMap {
  int numOfElements, capacity;
  struct node **arr;
};

void setNode(struct node *node, char *key, struct Opcode *value);

void initializeHashMap(struct hashMap *mp);

int hashFunction(struct hashMap *mp, char *key);

void insert(struct hashMap *mp, char *key, struct Opcode *value);

void delete_node(struct hashMap *mp, char *key);

struct Opcode *search(struct hashMap *mp, char *key);
