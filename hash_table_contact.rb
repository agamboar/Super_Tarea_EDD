class Contacto 
	attr_accessor :telefono, :nombre, :apellido, :direccion, :email;
	def initialize(telefono, nombre, apellido, direccion, email)
		@telefono = telefono
		@nombre = nombre
		@apellido = apellido
		@direccion = direccion
		@email = email
	end
end	


class Hash_Table
	attr_accessor :table_apellido;
	def initialize
		@table_apellido = Array.new(200)
		
	end
   

	def hash(apellido)
		bytes = apellido.downcase.bytes.to_a

		sum = bytes.inject{|sum,x| sum + x}

		return ((56687*102013)^99131*sum) % 200
	end

	def insert(contact)
		index_apellido = hash(contact.apellido)

		if @table_apellido[index_apellido] == nil
			@table_apellido[index_apellido] = contact
			return
		end
		puts "Lista de contactos llena"
	end

	def search(apellido)
		index_apellido = hash(apellido)
		if @table_apellido[index_apellido] != nil
			puts apellido, table_apellido[index_apellido].telefono, table_apellido[index_apellido].nombre, table_apellido[index_apellido].direccion, table_apellido[index_apellido].email
		return
		end
		puts "Contacto no encontrado"
	end

	def delete(apellido)
		index_apellido = hash(apellido)
		if @table_apellido[index_apellido] != nil
			@table_apellido[index_apellido] = nil
			return 
		end

		puts "No se pudo eliminar el contacto"
	end
end




c1 = Contacto.new("33244115", "Alvaro", "Gamboa", "Cerro Tronador", "alvaro.gamboa@mail.udp.cl")
c2 = Contacto.new("55937819", "Pepe", "Lopez", "Siempreviva", "pepe.lopez@mail.udp.cl")
c3 = Contacto.new("99541331", "Juana", "De Arco", "Borgoña", "juanadearco@mail.udp.cl")

h = Hash_Table.new

h.insert(c1)
h.insert(c2)
h.insert(c3)
h.search("Gamboa")
h.search("Lopez")
h.search("De Arco")
h.delete("Lopez")
h.search("Lopez")


