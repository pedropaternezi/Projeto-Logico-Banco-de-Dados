-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
drop database ecommerce;
use ecommerce;


-- criar tabela cliente
create table clients(
		idCliente int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
		Address varchar(45),
		constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

desc clients;
-- criar tabela produto

-- size = dimensão do produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        Classification_kids bool default false,
        Category enum ('Eletronico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
		Avaliação float default 0,
        Size varchar(10)
);
-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no esquema relacional
-- criar constraints relacionadas ao pagamento
create table payments(
		idclient int,
        idPayment int,
        typePayment enum('Boleto','Cartão','Dois Cartões'),
        limitAvailable float,
        primary key(idClient, idPayment)

);

-- criar tabela pedido
drop table orders;
create table orders(
		idOrder int auto_increment primary key,
        idOrderClient int,
        orderStatus enum('Cancelado','Confirmado', 'Em Processamento') default 'Em Processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash boolean default false,
        constraint fk_orders_client foreign key (idOrderClient) references clients(idCliente)
        );
        desc orders;
        
        -- criar tabela estoque
        create table productsStorage(
        idProdStorage int auto_increment primary key,
		storagelocation varchar(255),
        quantity float default 0
        );
        
        -- criar tabela fornecedor
        create table supplier(
		idSupplier int auto_increment primary key,
		SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
        );
		desc supplier;
        
        -- criar tabela vendedor
		create table supplier(
		idSupplier int auto_increment primary key,
		SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
        );
        
        -- criar tabela vendedor
              create table seller(
		idSeller int auto_increment primary key,
		SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        Location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
        );
        
        create table productSeller(
        idPseller int,
        idPProduct int,
        prodQuantity int default 1,
        primary key (idPseller, idPProduct),
        constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
        constraint fk_product_product foreign key (idPproduct) references product (idProduct)
        );
        
        desc productSeller;
        
        create table productOrder(
		idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
        constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
        );
        
        create table StorageLocation(
        idLproduct int,
        idLstorage int,
        Location varchar(255) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idlproduct) references product(idProduct),
		constraint fk_storage_location_storage foreign key (idLstorage) references productsStorage(idProdStorage)
        );
        
   create table productSupplier(
		idPsSupplier int,
		idPsProduct int,
		quantity int not null,
		primary key (idPsSupplier, idPsProduct),
		constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
		constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
		);
   
   desc productSupplier;
   
   show tables;
   
   show databases;
   use information_schema;
   show tables;
   desc referential_constraints;
   select * from referential_constraints where constraint_schema = 'ecommerce';
        
        
        
        
        
        
        
        
        
        
        
        
        
        





