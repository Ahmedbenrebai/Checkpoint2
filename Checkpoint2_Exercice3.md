### Q.3.1 

Le matériel réseau A est un switch 

- Il connecte tous les ordinateurs au réseau local et les permet de communiquer entre eux dans le même réseau local.

### Q.3.2

 Le matériel réseau B est un routeur 

-  Le routeur B permet de router le trafic entre le réseau local 10.10.0.0/16 et d'autres réseaux, comme le réseau 10.12.2.0/24 connecté à R2 et il sert de passerelle pour les ordinateurs du réseau 10.10.0.0/16.

### Q.3.3

- f0/0: Interface FastEthernet 0/0 
- g1/0: Interface GigabitEthernet 1/0 

### Q.3.4

- /16 dans l'adresse IP 10.11.80.2/16 représente le masque de sous-réseau qui signifie que les 16 premiers bits de l'adresse IP sont utilisés pour identifier le réseau

### Q.3.5

- L'adresse 10.10.255.254 est l'adresse IP de la passerelle par défaut configurée pour l'ordinateur PC2. C'est l'adresse IP qu'il utilise pour envoyer des paquets à des destinations en dehors de son réseau local.

### Q.3.6

- PC1 10.10.4.1/16 :
  - Adresse de réseau : 10.10.0.0
  - Première adresse disponible : 10.10.0.1
  - Dernière adresse disponible : 10.10.255.254
  - Adresse de diffusion : 10.10.255.255

- PC2 10.11.80.2/16 :
  - Adresse de réseau : 10.11.0.0
  - Première adresse disponible : 10.11.0.1
  - Dernière adresse disponible : 10.11.255.254
  - Adresse de diffusion : 10.11.255.255

- PC5 10.10.4.7/15 :
  - Adresse de réseau : 10.10.0.0
  - Première adresse disponible : 10.10.0.1
  - Dernière adresse disponible : 10.11.255.254
  - Adresse de diffusion : 10.11.255.255

### Q.3.7 

Les ordinateurs pourront communiquer entre eux s'ils sont sur le même réseau 

- PC1,pc3,pc4 peut communiquer entre eux parce qu'ils sont tous dans le même réseau 10.10.0.0/16.
- PC2 ne pourra pas communiquer directement avec les autres ordinateurs sans passer par un routeur car il est dans le réseau 10.11.0.0/16.
- PC5 peut communiquer avec PC1,PC3,PC4 car il est dans le réseau 10.10.0.0/15 

### Q.3.8

- Tous les ordinateurs peuvent atteindre le réseau 172.16.5.0/24 à condition que la route vers ce réseau soit configurée sur les routeurs B et R2 et que les passerelles par défaut soient correctement configurées sur chaque PC.

### Q.3.9

- Si on intervertit les ports de connexion de PC2 et PC3 sur le switch A il n'y aura aucune incidence sur leur capacité à communiquer sur le réseau. Les ports du switch A sont interchangeables pour des périphériques de même type.

### Q.3.10

Pour passer les configurations IP en dynamique :

- Configurer un serveur DHCP sur le réseau
- Configurer chaque ordinateur pour obtenir une adresse IP automatiquement via DHCP.

### Q.3.11

- le matériel qui initialise la communication est PC1 00:50:79:66:68:00

### Q.3.12

- Oui la communication a réussi c'est entre PC1 10.10.4.1et PC4 10.10.4.2 

### Q.3.13

Request 

- PC1 , Adresse IP : 10.10.4.1 , Adresse MAC : 00:50:79:66:68:00

Reply

- PC4 , Adresse IP : 10.10.4.2 , Adresse MAC : 00:50:79:66:68:03

### Q.3.14

- Le Protocole encapsulé : ARP est utilisé pour mapper les adresses IP à leurs adresses MAC correspondantes

### Q.3.15

Matériel A le Switch

- Aiguillage des paquets ICMP entre PC1 et PC4 au même réseau local
- Transfert des trames Ethernet basées sur les adresses MAC

Matériel B le Routeur

Non impliqué dans cette communication Parce que  les paquets ICMP échangés sont dans le même réseau 
### Q.3.16

- PC3 ,  Adresse IP : 10.10.80.3


### Q.3.17

- Protocole encapsulé : ICMP
- Le protocole ICMP est utilisé pour envoyer des messages de diagnostic et de contrôle à l'aide de requêtes et de réponses ping

### Q.3.18

- La communication n'a pas réussi cela pourrait être dû à une mauvaise configuration de la passerelle, à une route manquante

### Q.3.19

- Ce paquet indique que la passerelle 10.10.255.254 a reçu un message ICMP de 10.10.80.3 destiné à 10.11.80.2 mais qu'elle ne peut pas atteindre l'hôte cible 10.11.80.2. La passerelle renvoie donc un message ICMP de type "Destination unreachable" à la source 10.10.80.3 pour l'informer que l'hôte cible est injoignable.
 

### Q.3.20

Matériel A Switch
- Le switch A a transféré les paquets entre PC3  10.10.80.3 et le routeur B 10.10.255.254

Matériel B Routeur
- Le routeur B a tenté de router les paquets ICMP de 10.10.80.3 vers 10.11.80.2. En constatant que l'hôte destination était injoignable

### Q.3.21

**1** 
- Source : PC4 10.10.4.2
- Destination :  R2 172.16.5.253

**2**
- Source : R2 172.16.5.253
- Destination : PC4 10.10.4.2

**3**
- Source : PC4 10.10.4.2
- Destination : R2 172.16.5.253

**4**
- Source R2 172.16.5.253
- Destination : PC4 10.10.4.2

**5**
- Source : PC4 10.10.4.2
- Destination : R2 172.16.5.253

**6**
- Source : R2 172.16.5.253
- Destination : PC4 10.10.4.2

### Q.3.23

- La communication a été enregistrée sur le lien entre PC4 et le routeur B, ou bien sur le lien entre le routeur B et le routeur R2 vu que nous voyons les réponses aller-retour cela pourrait être sur le lien entre le routeur B et le routeur R2
