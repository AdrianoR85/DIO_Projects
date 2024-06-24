create table client(
	idClient int auto_increment primary key,
	Fname varchar(10),
	Mint char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Phone char(11) not null,
	constraint unique_cpf_client unique (CPF)
);

create table address(
	idAddress int primary key auto_increment,
	idAddressClient int,
	Street varchar(50),
	Anumber varchar(10),
	City varchar(30),
	State char(2),
	PostalCode varchar(11),
	constraint fk_client_address foreign key (idAddressClient) references client(idClient)
);

create table product(
	idProduct int primary key auto_increment,
	Pname varchar(10),
	Classificationkids bool,
	Category enum('Eletrônico', 'Vestimento', 'Brinquedo', 'Alimentos') not null,
	Reviews float default 0,
	size varchar(10)
);

create table payment(
	idPayment int primary key auto_increment,
	idPaymentClient int,
	TypePayment enum('Boleto', 'Cartão', 'Dois cartões'),
	limitAvaible float,
	constraint fk_payment_client foreign key (idPaymentClient) references client(idClient)
);

create table orders(
	idOrder int primary key auto_increment,
	idOrderClient int, 
	OrderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
	OrderDescription varchar(255),
	sendValue float default  10,
	PaymentCash bool default false,
	constraint fk_orders_client foreign key (idOrderClient) references client(idClient)
);

create table productStorage(
	idProdStorage int primary key auto_increment,
	idProductSupplier int,
	StorageLocation varchar(255),
	quantity int default 0,
	constraint fk_product_supplier foreign key (idProductSupplier) references supplier(idSupplier)
);

create table supplier(
	idSupplier int primary key auto_increment,
	SocialName varchar(255) not null,
	CNPJ char(11),
	Contact char(11) not null,
	constraint unique_cnpj_supplier unique (CNPJ)
);

create table seller(
	idSeller int primary key auto_increment,
	SocialName varchar(255) not null,
	AbstName varchar(255),
	CNPJ char(11),
	CPF char(9),
	Location varchar(255),
	Contact char(11) not null,
	constraint unique_cnpj_seller unique (CNPJ),
	constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idProdSeller int,
	idProdProduct int,
	ProdQuantity int default 1,
	primary key (idProdSeller, idProdProduct),
	constraint fk_product_seller foreign key (idProdSeller) references seller(idSeller),
	constraint fk_product_product foreign key (idProdProduct) references product(idProduct)
);

create table productOrder(
	idProdOrder int,
	idOrderProduct int,
	PoQuantity int default 1,
	PoStatus enum('Disponível', 'Sem Estoque') default 'Disponível',
	primary key (idProdOrder, idOrderProduct),
	constraint fk_product_prod foreign key (idProdOrder) references product(idProduct),
	constraint fk_product_order foreign key (idOrderProduct) references orders(idOrder)
);

create table storageLocation(
	idLocProduct int,
	idLocStorage int,
	Location varchar(255) not null,
	primary key (idLocProduct, idLocStorage),
	constraint fk_local_product foreign key (idLocProduct) references product(idProduct),
	constraint fk_local_starage foreign key (idLocStorage) references productStorage(idProdStorage)
);

ALTER TABLE productStorage
ADD COLUMN price float(10, 2);

