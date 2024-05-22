# FoundryPrivacy 🚀

🚀
🚀Pour résoudre le niveau 12 de l'Ethernaut intitulé "Privacy", il faut comprendre comment Ethereum stocke les variables dans des emplacements de 32 octets appelés slots. Le contrat contient plusieurs variables, y compris un tableau data de trois éléments de type bytes32. Les variables sont stockées séquentiellement dans les slots en fonction de leur ordre de déclaration. Les premières variables (locked, ID, flattening, denomination et awkwardness) occupent les premiers slots. Le tableau data commence à partir du slot 3, donc data[2] se trouve dans le slot 5. Pour accéder à la clé privée, il faut récupérer la valeur du slot 5 et tronquer cette valeur de 32 octets à 16 octets. Ensuite, utilisez cette valeur tronquée pour appeler la fonction unlock et déverrouiller le contrat. Cela démontre que les variables privées ne sont pas réellement sécurisées sur une blockchain publique et qu'une bonne compréhension des mécanismes de stockage est cruciale pour manipuler les contrats intelligents.🚀

🚀tsai le mec qu'a un seul 🚀emoji🚀
