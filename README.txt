                                            ==============================
                                            ||OrcMan (Orchestra Manager)||
                                            ==============================


Bem vindo ao OrcMan, seu gerenciador de orquestras , com ele você vai poder gerenciar suas orquestras , seus maestros seus integrantes e instrumentos.

Você poderá incluir , excluir, alterar e visualizar suas orquestras, maestros, integrantes e instrumentos com um menu de fácil uso.

Nesse readme você encontra as seguintes explicações :


        0- Modelo do Banco
        
        1- Compilação e execução do Programa  - Linha 21
           1.1- Compilação                    - Linha 24
           1.2- Execução                      - Linha 32
           
        2- Menu Inicial                       - Linha 38 
           2.1- Apresentação do Menu          - Linha 40
           2.2- Explicação dos Itens do Menu  - Linha
                2.2.1- Orquestra              - Linha
                2.2.2- Maestro                - Linha
                2.2.3- Integrante             - Linha
                2.2.4- Instrumento            - Linha
                2.2.5- Sair                   - Linha
           
        3- Menu Orquestra - Linha 
        4- Menu Maestro- Linha 
        5- Menu Integrante - Linha 
        6- Menu Instrumento - Linha 
        


0- Modelo do Banco

   
   +---------+           +-----------+            +------------+           +-------------+
   | Maestro |1---------1| Orquestra |1----------N| Integrante |N---------1| Instrumento |
   +---------+           +-----------+            +------------+           +-------------+ 
                                 
   

1- Compilação e execução do programa
    
    1.1- Compilação
          
          Para compilar o OrcMan é simples, na primeira vez que você for executá-lo você devera executar o make
          Depois disso você não ira mais necessitar do make.
    
    
    1.2- Execução
          
          Após executar o make basta digitar a seguinte linha de comando no terminal e você já estará usando o OrcMan:
                
                > ruby orquestra.rb

2- Menu inicial

    2.1- Apresentação do Menu
  
         
         Esse é o Menu Inicial :
    
    
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
      "#       Gerenciador de orquestras     #"
      "#                                     #"
      "#       Digite um número abaixo       #"
      "#       para continuar                #"
      "#                                     #"
      "#       1-Orquestra                   #"
      "#       2-Maestro                     #"
      "#       3-Integrante                  #"
      "#       4-Instrumentos                #"
      "#       5-Sair                        #"
      "#                                     #"
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
          
          
          Para acessar cada item basta digitar um desses números e apertar a tecla Enter
          
    2.2- Explicação dos Itens do Menu
      
        2.2.1 - Orquestra
          
                Ao digitar o número 1 e pressionar enter você será direcionado ao menu de orquestra, aonde você poderá criar, excluir, alterar, visualizar as suas orquestras e associa-las à um maestro.
                Mais explicações sobre o menu na linha 
                
                
        2.2.2 - Maestro
          
                Ao digitar o número 2 e pressionar enter você será direcionado ao menu de Maestro, aonde você poderá criar, excluir, alterar, visualizar os seus maestros e associa-los à uma orquestra.
                Mais explicações sobre o menu na linha
                
        2.2.3 - Integrante
          
                Ao digitar o número 3 e pressionar enter você será direcionado ao menu de Integrante, aonde você poderá criar, excluir, alterar, visualizar os seus integrantes e associa-los à uma orquestra e à um instrumento.
                Mais explicações sobre o menu na linha 
                
                
        2.2.4 - Instrumento
          
                Ao digitar o número 4 e pressionar enter você será direcionado ao menu de Instrumento, aonde você poderá criar, excluir, alterar, visualizar os seus instrumento e associa-los à um integrante ou à uma orquestra.
                Mais explicações sobre o menu na linha 
                
                
        2.2.5 - Sair
          
                Ao digitar o número 5 você ira finalizar o programa



3- Menu Orquestra

    3.1- Apresentação do Menu
  
         
         Esse é o Menu Orquestra :
    
    
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
      "#       Gerenciador de orquestras     #"
      "#                                     #"
      "#             Orquestras              #"
      "#                                     #"
      "#       Digite um número abaixo       #"
      "#       para continuar                #"
      "#                                     #"
      "#       1-Criar Orquestra             #"
      "#       2-Alterar Orquestra           #"
      "#       3-Apagar Orquestra            #"
      "#       4-Mostrar Orquestra           #"
      "#       5-Associar Maestro            #"
      "#       6-Associar Integrante         #"
      "#       7-Associar Instrumento        #"
      "#       8-Sair                        #"
      "#                                     #"
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
          
          
          Para acessar cada item basta digitar um desses números e apertar a tecla Enter
          
    3.2- Explicação dos Itens do Menu
      
        3.2.1 - Criar Orquestra
          
                Ao digitar o número 1 e pressionar enter você será direcionado ao menu de Criação de orquestra, você deverá digitar o nome e a cidade dela para que sua orquestra seja salva.
                
                
        3.2.2 - Alterar Orquestra
          
                Ao digitar o número 2 e pressionar enter você será direcionado ao menu de Alterar Orquestra, você poderá alterar o nome e/ou a cidade dela .
            
                
        3.2.3 - Apagar Orquestra
          
                Ao digitar o número 3 e pressionar enter você será direcionado ao menu de Apagar orquestra, aonde você ira excluir sua orquestra , lembre-se que ao excluir uma orquestra você ira desassociar sua orquestra de seus integrantes,maestro e instrumentos.
              
            
        3.2.4 - Mostrar Orquestra
          
                Ao digitar o número 4 e pressionar enter será mostrado todas as orquestras que estão cadastradas no banco e suas associações .
                
                
        3.2.5 - Associar Maestro
          
                Ao digitar o número 5 e pressionar enter você será direcionado ao menu de associação de Maestro, aonde você poderá associar sua orquestra à um maestro, lembre-se que a associação entre o maestro e a orquestra é de 1 para 1 , ou seja um maestro por orquestra, uma orquestra para um maestro, se você associar um maestro que já esteja associado a uma orquestra, em outra orquestra você irá perder a associação com a orquestra anterior, assim como associar um maestro a uma orquestra que já tenha um maestro, a orquestra irá perder a associação com o antigo maestro.
           
                
        3.2.6 - Associar Integrante
          
              Ao digitar o número 6 e pressionar enter você será direcionado ao menu de associação de Maestro, aonde você poderá associar sua orquestra à um integrante, lembre-se que a associação entre o integrante e a orquestra é de 1 para N , ou seja n integrantes por orquestra, e uma orquestra para um integrante, se você associar uma orquestra em um integrante que já tenha uma associação com orquestra você perdera essa associação.
                
        3.2.7 - Associar Instrumento
          
              Ao digitar o número 7 e pressionar enter você será direcionado ao menu de associação de Instrumento, aonde você poderá associar sua orquestra à um instrumento, a associação entre o instrumento e a orquestra é de N para N , ou seja n integrantes por orquestra, e N orquestras por instrumento.
                
                
        3.2.8 - Sair
          
                Ao digitar o número 8 você ira voltar ao menu inicial.
    
    
4- Menu Maestro

    4.1- Apresentação do Menu
  
         
         Esse é o Menu Maestro :
    
    
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
      "#       Gerenciador de orquestras     #"
      "#                                     #"
      "#             Maestro                 #"
      "#                                     #"
      "#       Digite um número abaixo       #"
      "#       para continuar                #"
      "#                                     #"
      "#       1-Criar Maestro               #"
      "#       2-Alterar Maestro             #"
      "#       3-Apagar Maestro              #"
      "#       4-Mostrar Maestro             #"
      "#       5-Associar à orquestra        #"
      "#       6-Sair                        #"
      "#                                     #"
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
          
          
          Para acessar cada item basta digitar um desses números e apertar a tecla Enter
          
    4.2- Explicação dos Itens do Menu
      
        4.2.1 - Criar Maestro
          
                Ao digitar o número 1 e pressionar enter você será direcionado ao menu de Criação de maestro, você deverá digitar o nome e a idade dele para que seu Maestro seja salvo.
                
                
        4.2.2 - Alterar Maestro
          
                Ao digitar o número 2 e pressionar enter você será direcionado ao menu de Alterar Maestro, você poderá alterar o nome e/ou a idade dele.
            
                
        4.2.3 - Apagar Maestro
          
                Ao digitar o número 3 e pressionar enter você será direcionado ao menu de Apagar Maestro, aonde você ira excluir seu maestro.
              
            
        4.2.4 - Mostrar Maestro
          
                Ao digitar o número 4 e pressionar enter será mostrado todos os Maestros que estão cadastradas no banco, caso eles tenham alguma associação com uma orquestra, essa orquestra tambêm será mostrada.
                
                
        4.2.5 - Associar Maestro
          
                Ao digitar o número 5 e pressionar enter você será direcionado ao menu de associação de Maestro, aonde você poderá associar sua orquestra à um maestro, lembre-se que a associação entre o maestro e a orquestra é de 1 para 1 , ou seja um maestro por orquestra, uma orquestra para um maestro, se você associar um maestro que já esteja associado a uma orquestra, em outra orquestra você irá perder a associação com a orquestra anterior, assim como associar um maestro a uma orquestra que já tenha um maestro, a orquestra irá perder a associação com o antigo maestro.
                
        4.2.6 - Sair
          
                Ao digitar o número 6 você ira voltar ao menu inicial.
                


3- Menu Integrante

    3.1- Apresentação do Menu
  
         
         Esse é o Menu Integrante :
    
    
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
      "#       Gerenciador de orquestras     #"
      "#                                     #"
      "#             Integrante              #"
      "#                                     #"
      "#       Digite um número abaixo       #"
      "#       para continuar                #"
      "#                                     #"
      "#       1-Criar Integrante            #"
      "#       2-Alterar Integrante          #"
      "#       3-Apagar Integrante           #"
      "#       4-Mostrar Integrante          #"
      "#       5-Associar Integrante         #"
      "#       6-Associar Integrante         #"
      "#       7-Associar Instrumento        #"
      "#       8-Sair                        #"
      "#                                     #"
      "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
          
          
          Para acessar cada item basta digitar um desses números e apertar a tecla Enter
          
    3.2- Explicação dos Itens do Menu
      
        3.2.1 - Criar Integrante
          
                Ao digitar o número 1 e pressionar enter você será direcionado ao menu de Criação de Integrante, você deverá digitar o nome e a cidade dela para que sua Integrante seja salva.
                
                
        3.2.2 - Alterar Integrante
          
                Ao digitar o número 2 e pressionar enter você será direcionado ao menu de Alterar Integrante, você poderá alterar o nome e/ou a cidade dela .
            
                
        3.2.3 - Apagar Integrante
        
                Ao digitar o número 3 e pressionar enter você será direcionado ao menu de Apagar Integrante, aonde você ira excluir sua Integrante , lembre-se que ao excluir uma Integrante você ira desassociar sua Integrante de seus integrantes,maestro e instrumentos.
              
            
        3.2.4 - Mostrar Integrante
          
                Ao digitar o número 4 e pressionar enter será mostrado todas as Integrante que estão cadastradas no banco e suas associações .
                
                
        3.2.5 - Associar Maestro
          
                Ao digitar o número 5 e pressionar enter você será direcionado ao menu de associação de Maestro, aonde você poderá associar sua orquestra à um maestro, lembre-se que a associação entre o maestro e a orquestra é de 1 para 1 , ou seja um maestro por orquestra, uma orquestra para um maestro, se você associar um maestro que já esteja associado a uma orquestra, em outra orquestra você irá perder a associação com a orquestra anterior, assim como associar um maestro a uma orquestra que já tenha um maestro, a orquestra irá perder a associação com o antigo maestro.
           
                
        3.2.6 - Associar Integrante
          
              Ao digitar o número 6 e pressionar enter você será direcionado ao menu de associação de Maestro, aonde você poderá associar sua orquestra à um integrante, lembre-se que a associação entre o integrante e a orquestra é de 1 para N , ou seja n integrantes por orquestra, e uma orquestra para um integrante, se você associar uma orquestra em um integrante que já tenha uma associação com orquestra você perdera essa associação.
                
        3.2.7 - Associar Instrumento
          
              Ao digitar o número 7 e pressionar enter você será direcionado ao menu de associação de Instrumento, aonde você poderá associar sua orquestra à um instrumento, a associação entre o instrumento e a orquestra é de N para N , ou seja n integrantes por orquestra, e N orquestras por instrumento.
                
                
        3.2.8 - Sair
          
                Ao digitar o número 8 você ira voltar ao menu inicial.               
                
