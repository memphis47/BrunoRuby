# -*- coding: utf-8 -*-
require 'active_record'

# Só execute este programa depois de criar o banco de dados (ruby
# criaSchema.rb)

# Este exemplo só tem dois "parâmetros" (adapter e database). Porém,
# existem outros: (host, username, password), que podem ser usados com
# outros bancos de dados.
ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Orquestra.sqlite3" 


class Orchestra < ActiveRecord::Base; 
	has_one :conductor
	has_many :instruments, :through => :integrants
	has_many :integrants
	def CriarOrquestra
		puts 'Qual o Nome da Orquestra: '
		nome = gets.chomp
		nameFind=Orchestra.where(:nome=>nome)
		puts nameFind.inspect		
		if(nome!=" " && nameFind.empty?)
			self.nome=nome
			puts 'E qual a cidade da sua orquestra: '
			cidade = gets.chomp			
			if(cidade!=" ")
				self.cidade=cidade
				self.save()
				puts 'Sua orquestra foi salva !!'
				#AssociarOrquestra(self)
			else
				puts 'Sua orquestra precisa de uma cidade'
			end
		end
		if(nome=="" )
			puts 'Sua orquestra precisa de um nome ou já existe'
		end
	end
	def ApagarOrquestra
		puts 'Qual orquestra você quer apagar ?'
		nome = gets.chomp
		orc=Orchestra.where(:nome => nome)#.first.try(:destroy)
		if(!orc.empty?)
			puts "Foi encontrado as seguintes orquestras digite o Id de uma delas para apaga-la"		
			orc.each do |orquestra|
					puts "Id: #{orquestra.id} Nome: #{orquestra.nome} Cidade: #{orquestra.cidade}"		
			end			
			id=gets.chomp
			orchestra = Orchestra.find(id)
			orchestra.clear
			puts "Essa Orquestra foi apagada !"
		else
			puts "Não foi encontrado nenhuma orquestra com esse nome"
		end
		#Orchestra.where(:nome => nome).first.try(:destroy)
		
	end
	def MostrarOrquestras
		orquestras= Orchestra.all
		orquestras.each do |orquestra|
			if(orquestra.conductor_id!=nil)
				maestro=Conductor.where(:id => orquestra.conductor_id)
				if(!maestro.empty?)
					integrantes=Integrant.where(:orchestra_id => orquestra.id)
					if(!integrantes.empty?)
						puts "#{orquestra.nome}, que pertence a cidade #{orquestra.cidade}"
						puts "tem como maestro #{maestro.first.nome} "
						integrantes.each do |integrante|
							if(integrante.nome!=nil)
								puts"Possui o integrante #{integrante.nome}"
								if(integrante.instrument_id!=nil)
									inst=Instrument.where(:id => integrante.instrument_id).first
									puts"Que toca o instrumento #{inst.tipo}"
								else
									puts "Que não toca nenhum instrumento"
								end
							else
								if (integrante.instrument_id!=nil)
									inst=Instrument.where(:id => integrante.instrument_id).first
									puts"A orquestra tem o instrumento #{inst.tipo}"
								end
							end
						end
					else
						puts "#{orquestra.nome}, que pertence a cidade #{orquestra.cidade}"
						puts "e tem como maestro #{maestro.first.nome} "
					end
				else
					integrantes=Integrant.where(:orchestra_id => orquestra.id)
					if(!integrantes.empty?)
						puts "#{orquestra.nome}, que pertence a cidade #{orquestra.cidade}"
						
						integrantes.each do |integrante|
							if(integrante.nome!=nil)
								puts"Possui o integrante #{integrante.nome}"
								if(integrante.instrument_id!=nil)
									inst=Instrument.where(:id => integrante.instrument_id).first
									puts"Que toca o instrumento #{inst.tipo}"
								else
									puts "Que não toca nenhum instrumento"
								end
							else
								if (integrante.instrument_id!=nil)
									inst=Instrument.where(:id => integrante.instrument_id).first
									puts"A orquestra tem o instrumento #{inst.tipo}"
								end
							end
						end
					else
						puts "#{orquestra.nome}, que pertence a cidade #{orquestra.cidade}"
						
					end
					
				end
			else
				integrantes=Integrant.where(:orchestra_id => orquestra.id)
				if(!integrantes.empty?)
					puts "#{orquestra.nome}, que pertence a cidade #{orquestra.cidade}"
					integrantes.each do |integrante|
						if(integrante.nome!=nil)
							puts"Possui o integrante #{integrante.nome}"
							if(integrante.instrument_id!=nil)
								inst=Instrument.where(:id => integrante.instrument_id).first
								puts"Que toca o instrumento #{inst.nome}"
							else
								puts "Que não toca nenhum instrumento"
							end
						else
							if (integrante.instrument_id!=nil)
								inst=Instrument.where(:id => integrante.instrument_id).first
								puts"A orquestra tem o instrumento #{inst.nome}"
							end
						end
					end
				else
					puts "#{orquestra.nome}, que pertence a cidade #{orquestra.cidade}"
				end
			end
			puts"--------------------------------------"
		end
	end
	def AlterarOrquestra
		puts "Qual orquestra você quer alterar"
		nome=gets.chomp
		if(nome!=nil)
			orc=Orchestra.where(:nome => nome)#.first.try(:destroy)
			if(!orc.empty?)
				puts "Foi encontrado as seguintes orquestras digite o Id de uma delas para altera-la"		
				orc.each do |orchestra|
					puts "Id: #{orchestra.id} Nome: #{orchestra.nome} Cidade: #{orchestra.cidade}"
				end		
				id=gets.chomp
				orquestra = Orchestra.where(:id=>id)
				if(!orquestra.empty?)
					puts "Digite o novo nome da orquestra, caso não deseje alterar aperte enter"
					nome=gets.chomp
					if(nome!="")
					  orquestra.first.nome=nome
					end
					puts "Digite o nova cidade da orquestra, caso não deseje alterar aperte enter"
					cidade=gets.chomp
					if(cidade!="")
					  orquestra.first.cidade=cidade
					end
					orquestra.first.save()
					puts "Suas alterações foram salvas !!!"
				else
					puts "Orquestra não cadastrada"
				end
			end
		end
	end
end

class Conductor < ActiveRecord::Base;
	belongs_to :orchestra
 
	def AssociarOrquestra(maestro)
		puts "Deseja Associar o seu maestro a alguma orquestra ? (Sim/Não)"
		resp=gets.chomp.downcase		
		while(resp=="sim" || resp=="s")
			puts "Qual Orquestra você quer associar o seu maestro"
			nomeOrc= gets.chomp
			orc=Orchestra.where(:nome=>nomeOrc)
			if(!orc.empty?)
				puts "Foi encontrado as seguintes orquestras digite o Id de uma delas para altera-la"		
				orc.each do |orchestra|
					puts "Id: #{orchestra.id} Nome: #{orchestra.nome} Cidade: #{orchestra.cidade}"
				end		
				id=gets.chomp
				orquestra = Orchestra.where(:id=>id)
				if(!orquestra.empty?)
					if(orquestra.first.conductor_id==nil)
						orquestra.first.conductor_id = maestro.id
						orquestra.first.save()
						puts "Associação Feita !!!"
						resp="nao"
					else
						puts "Essa orquestra já tem um maestro você deseja dessasocia-lo da orquestra ? (Sim/Nao)"
						resp=gets.chomp.downcase
						if(resp=="sim" || resp=="s")
							orquestra.first.conductor_id = maestro.id
							orquestra.first.save()
							puts "Associação Feita !!!"
							resp="nao"
						else
							puts "Seu maestro não foi associado a nenhuma orquestra"
						end
					end	
				else
					puts "Orquestra não cadastrada"
				end
			else
				puts "Não foi encontrado nenhuma Orquestra com esse nome digite sim para continuar procurando"
				resp=gets.chomp.downcase
			end
		end
	end
	def CriarMaestro
		puts 'Qual o Nome do Maestro: '
		nome = gets.chomp
		
		if(nome!=" ")
			self.nome=nome
			puts 'E qual a idade do seu maestro: '
			idade = gets.chomp			
			if(idade!=" ")
				self.idade=idade
				self.save()
				puts 'Seu Maestro foi salvo !!'
				AssociarOrquestra(self)
			else
				puts 'Seu Maestro precisa de uma idade'
			end
		else
			puts 'Seu Maestro precisa de um nome ou já existe'
		end
	end
	def ApagarMaestro
		puts 'Qual Maestro você quer apagar ?'
		nome = gets.chomp
		cond=Conductor.where(:nome => nome)#.first.try(:destroy)
		if(!cond.empty?)
			puts "Foi encontrado os seguintes maestros digite o Id de um deles para apaga-lo"		
			cond.each do |conductor|
					puts "Id: #{conductor.id} Nome: #{conductor.nome} idade: #{conductor.idade}"		
			end			
			id=gets.chomp
			orchestra = Orchestra.where(:conductor_id => id)
			if(!orchestra.empty?)
				orchestra.first.conductor_id=nil
				orchestra.save()
			end
			cond.first.destroy
			puts "Esse Maestro foi apagado !"
		else
			puts "Não foi encontrado nenhum maestro com esse nome"
		end
		#Orchestra.where(:nome => nome).first.try(:destroy)
		
	end

	def MostrarMaestro
		conds= Conductor.all
		if(!conds.empty?)
			conds.each do |cond|
				orc=Orchestra.where(:conductor_id => cond.id)
				
				if(orc.exists?)
					puts "#{cond.nome}, que pertence a Orquestra #{orc.first.nome}, e tem a idade de #{cond.idade}"
				else
					puts "#{cond.nome}, que não pertence a nenhuma orquestra, e tem a idade de #{cond.idade}"
				end
			end
		else
			puts("Não ha nenhum maestro registrado")
		end
	end

	def AlterarMaestro
		puts "Qual maestro você quer alterar"
		nome=gets.chomp
		if(nome!=nil)
			cond=Conductor.where(:nome => nome)
			if(!cond.empty?)
				puts "Foi encontrado os seguintes Maestros digite o Id de uma delas para altera-la"		
				cond.each do |conductor|
					puts "Id: #{conductor.id} Nome: #{conductor.nome} idade: #{conductor.idade}"
				end		
				id=gets.chomp
				cond = Conductor.where(:id=>id)
				if(cond.exists?)
					puts "Digite o novo nome do maestro, caso não deseje alterar aperte enter"
					nome=gets.chomp
					if(nome !="")
					  cond.first.nome=nome
					end
					puts "Digite a nova idade do maestro, caso não deseje alterar aperte enter"
					idade=gets.chomp
					if(idade !=" ")
					  cond.first.idade=idade
					end
					cond.first.save()
					puts "Suas alterações foram salvas !!!"
				else
					puts "Maestro não cadastrado"
				end
			end
		end
	end
end

class Instrument < ActiveRecord::Base;
	has_many :orchestras, :through => :integrants
	has_many :integrants

	def CriarInstrumento
		puts 'Qual o Nome do Instrumento: '
		nome = gets.chomp
		if(nome!="")
			self.tipo=nome
			self.save()
			puts 'Seu Instrumento foi salvo !!'
		else(nome=="")
			puts 'Seu Instrumento precisa de um nome ou já existe'
		end
	end

	
	
	def MostrarInstrumento
		instrus= Instrument.all
		if(!instrus.empty?)
			instrus.each do |instru|
				puts "#{instru.tipo}"
				integs=Integrant.where(:instrument_id => instru.id)
				if(integs.exists?)
					integs.each do |integ|
						if(integ.nome!=nil)
							puts "Integrante que toca esse instrumento: #{integ.nome}"
						end
						if(integ.orchestra_id!=nil)
							orc=Orchestra.where(:id => integ.orchestra_id)
							if(!orc.empty?)
								puts "Orquestra que esse instrumento pertence: #{orc.first.nome}"
							end
						end
					end
				end
			end
		end
	end

	def Alterarinstrumento
		puts "Qual Instrumento você quer alterar"
		nome=gets.chomp
		if(nome!=nil)
			instr=Instrument.where(:nome => nome)
			if(!instr.empty?)
				puts "Foi encontrado os seguintes Maestros digite o Id de uma delas para altera-la"		
				instr.each do |instrumento|
					puts "Id: #{instrumento.id} Nome: #{instrumento.nome} idade: #{instrumento.idade}"
				end		
				id=gets.chomp
				instr = Instrument.where(:id=>id)
				if(instr.exists?)
					puts "Digite o novo nome do maestro, caso não deseje alterar aperte enter"
					nome=gets.chomp
					if(nome !=" ")
					  instr.first.tipo=nome
					end
					instr.first.save()
					puts "Suas alterações foram salvas !!!"
				else
					puts "Instrumento não cadastrado"
				end
			else
				puts "Instrumento não cadastrado"
			end
		end
	end
end

class Integrant < ActiveRecord::Base;
	belongs_to :orchestra
	belongs_to :instrument
	def CriarIntegrante
		puts 'Qual o Nome do Integrante: '
		nome = gets.chomp
		if(nome!=nil )
			self.nome=nome
			self.save()
			puts "Seu Integrante foi salvo"
		else
			puts 'Seu Integrante precisa de um nome'
		end
	end

	def ApagarIntegrante
		puts 'Qual Integrante você quer apagar ?'
		nome = gets.chomp
		cond=Conductor.where(:nome => nome)#.first.try(:destroy)
		if(!cond.empty?)
			puts "Foi encontrado os seguintes maestros digite o Id de um deles para apaga-lo"		
			cond.each do |conductor|
					puts "Id: #{conductor.id} Nome: #{conductor.nome} idade: #{conductor.idade}"		
			end			
			id=gets.chomp
			orchestra = Orchestra.where(:conductor_id => id)
			if(!orchestra.empty?)
				orchestra.conductors_id=nil
			end
			cond.destroy()
			puts "Esse Maestro foi apagado !"
		else
			puts "Não foi encontrado nenhum maestro com esse nome"
		end
		#Orchestra.where(:nome => nome).first.try(:destroy)
		
	end

	def MostrarIntegrante
		integrantes= Integrant.all
		if(!integrantes.empty?)
			integrantes.each do |integrante|
				orchestra=Orchestra.where(:id => integrante.orchestra_id)
				instrumento=Instrument.where(:id => integrante.instrument_id)
				case 
					when (orchestra.empty? && instrumento.empty?)
						puts "#{integrante.nome}, que não pertence a nenhuma orquestra e não toca nenhum instrumento "
					when (orchestra.empty?)
						puts "#{integrante.nome}, que não pertence a nenhuma orquestra, e toca o instrumento #{instrumento.first.tipo}"
					when (instrumento.empty?)
						puts "#{integrante.nome}, que pertence a orquestra #{orchestra.first.nome}, e não toca nenhum instrumento"
					when (integrante.nome==nil)
						puts ""
					else
						puts "#{integrante.nome}, que pertence a orquestra #{orchestra.first.nome}, e toca o instrumento #{instrumento.first.tipo}"			
				end 
			end
		end
	end

	def AlterarIntegrante
		puts "Qual integrante você quer alterar"
		nome=gets.chomp
		if(nome!=nil)
			inte=Integrant.where(:nome => nome)
			if(	inte.empty?)
				puts "Foi encontrado os seguintes Maestros digite o Id de uma delas para altera-la"		
				inte.each do |integr|
					puts "Id: #{integr.id} Nome: #{integr.nome} idade: #{integr.idade}"
				end		
				id=gets.chomp
				inte = Integrant.where(:id=>id).first
				if	(inte.exists?)
					puts "Digite o novo nome do maestro, caso não deseje alterar aperte enter"
					nome=gets.chomp
					if(nome !=" ")
					 	inte.nome=nome
					end
					puts "Digite a nova idade do maestro, caso não deseje alterar aperte enter"
					idade=gets.chomp
					if(idade !=" ")
					 	inte.idade=idade
					end
					inte.save()
					puts "Suas alterações foram salvas !!!"
				else
					puts "Maestro não cadastrado"
				end
			end
		end
	end
end



def ApagarInstrumento()
	puts 'Qual Instrumento você quer apagar ?'
	nome = gets.chomp
	inst=Instrument.where(:tipo => nome)#.first.try(:destroy)
	if(!inst.empty?)
		puts "Foi encontrado os seguintes instrumentos, digite o Id de um deles para apaga-lo"		
		inst.each do |instrumento|
			puts "Id: #{instrumento.id} Nome: #{instrumento.tipo}"		
		end			
		id=gets.chomp
			
		inst = Instrument.where(:id => id)
		Orchestra.instruments.delete(inst)
		inst.destroy()
		puts "Esse Instrumento foi apagado !"
	else
			puts "Não foi encontrado nenhum instrumento com esse nome"
	end
		#Orchestra.where(:nome => nome).first.try(:destroy)	
end

def AssociarOrquestraInstrumento
	puts "Deseja ver uma lista de orquestras disponiveis ?"
	resp=gets.chomp.downcase		
	if(resp=="sim" || resp=="s")
		listaOrquestra=Orchestra.all
		puts "----------------------------------"
		listaOrquestra.each do |orquestraListada|
			puts "Id: #{orquestraListada.id} Nome: #{orquestraListada.nome}"
			puts "----------------------------------"
		end
	end
	puts("Qual Orquestra você quer Associar à um Instrumento ?,caso não deseje associar a nenhum maestro aperte enter")
	nomeOrc=gets.chomp
	if(nomeOrc!="")
		orquestraFind=Orchestra.where(:nome => nomeOrc).first
		if(orquestraFind != nil)
			puts "Deseja ver uma lista de instrumentos disponiveis ?"
			resp=gets.chomp.downcase		
			if(resp=="sim" || resp=="s")
				listaInstrumento=Instrument.all
				puts "----------------------------------"
				listaInstrumento.each do |instrumentoListado|
					puts "Id: #{instrumentoListado.id} Nome: #{instrumentoListado.tipo}"
					puts "----------------------------------"
				end
			end
			puts("Qual instrumento você deseja associar a sua orquestra")
			nomeIn=gets.chomp
			instrumento=Instrument.where(:tipo => nomeIn)
			if(!instrumento.empty?)
				puts "Deseja associar o instrumento #{instrumentoFind.first.tipo} a orquestra #{orquestraFind.first.nome}"
				resp=gets.chomp.downcase		
				if(resp=="sim" || resp=="s")
					orquestraFind.first.instruments << instrumentoFind
				else
					puts "Ok"
				end
			end
		end
	else
		puts "Não foi encontrado nenhum instrumento"
	end
end

def AssociarOrquestraMaestro
	puts "Deseja ver uma lista de orquestras disponiveis ?"
	resp=gets.chomp.downcase		
	if(resp=="sim" || resp=="s")
		listaOrquestra=Orchestra.all
		puts "----------------------------------"
		listaOrquestra.each do |orquestraListada|
			puts "Id: #{orquestraListada.id} Nome: #{orquestraListada.nome}"
			puts "----------------------------------"
		end
	end
	puts("Qual Orquestra você quer Associar à um Maestro ?,caso não deseje associar a nenhum maestro aperte enter")
	nomeOrc=gets.chomp
	if(nomeOrc!="")
		orquestraFind=Orchestra.where(:nome => nomeOrc).first
		if(orquestras != nil)
			if(!orquestraFind.empty?)
				puts("Qual Maestro você deseja associar a sua orquestra")
				nomeMa=gets.chomp
				maestros=Conductor.where(:nome => nomeMa)
				if(!maestros.empty?)
					puts "Foi encontrado os seguintes Maestros, digite o Id de um deles para associar a orquestra,ou aperte enter caso não deseje associar nenhum maestro"		
					maestros.each do |maestro|
						puts "Id: #{maestro.id} Nome: #{maestro.nome}"		
					end
					idMaestro=gets.chomp
					if(idMaestro!="")
						maestroFind=Conductor.where(:id=> idMaestro)
							if(!maestroFind.empty?)
								if(orquestraFind.first.conductor_id!=nil)
									puts("Já existe um maestro associado a essa orquestra deseja dessasocia-lo ?")
									resp=gets.chomp.downcase		
									if(resp=="sim" || resp=="s")
										orquestraFind.first.conductor_id=maestroFind.first.id
										orquestraFind.first.save()
										puts "Maestro Associado"
									else
										puts "Ok"
									end
								else
									puts "Deseja associar o maestro #{maestroFind.first.nome} a orquestra #{orquestraFind.first.nome}"
									resp=gets.chomp.downcase		
									if(resp=="sim" || resp=="s")
										orquestraFind.first.conductor_id=maestroFind.first.id
										orquestraFind.first.save()
										puts "Maestro Associado"
									else
										puts "Ok"
									end
								end
							end
						end
					else
						puts("Não foi encontrado nenhum maestro com esse nome")
					end
				end
			end
		end
	end
end

def AssociarOrquestraIntegrante
	puts "Deseja ver uma lista de orquestras disponiveis ?"
	resp=gets.chomp.downcase		
	if(resp=="sim" || resp=="s")
		listaOrquestra=Orchestra.all
		puts "----------------------------------"
		listaOrquestra.each do |orquestraListada|
			puts "Id: #{orquestraListada.id} Nome: #{orquestraListada.nome}"
			puts "----------------------------------"
		end
	end
	puts("Qual Orquestra você quer Associar à um integrante ?,caso não deseje associar a nenhum Integrante aperte enter")
	nomeOrc=gets.chomp
	if(nomeOrc!="")
		orquestraFind=Orchestra.where(:nome => nomeOrc).first
		if(orquestraFind != nil)
			puts "Deseja ver uma lista de integrantes disponiveis ?"
			resp=gets.chomp.downcase		
			if(resp=="sim" || resp=="s")
				listaIntegrante=Integrant.all
				puts "----------------------------------"
				listaIntegrante.each do |integranteListado|
					if(integranteListado.nome != nil)
						puts "Id: #{integranteListado.id} Nome: #{integranteListado.nome}"
						puts "----------------------------------"
					end
				end
			end
			puts("Qual o ID do Integrante que você deseja associar a sua orquestra")
			idintegrante=gets.chomp
			if(idintegrante!="")
				integranteFind=Integrant.where(:id=> idintegrante)
				if(!integranteFind.empty?)
					if(integranteFind.first.orchestra_id!=nil)
						puts("Já existe uma Orquestra associada a esse integrante deseja dessasocia-la ?")
						resp=gets.chomp.downcase		
						if(resp=="sim" || resp=="s")
							ind.first.orchestra_id=orquestraFind.id
							integranteFind.first.save()
							puts "integrante Associado"
						else
							puts "Ok, adeus"
						end
					else
						puts "Deseja associar o integrante #{integranteFind.first.nome} a orquestra #{orquestraFind.nome}"
						resp=gets.chomp.downcase		
						if(resp=="sim" || resp=="s")
							integranteFind.first.orchestra_id=orquestraFind.id
							integranteFind.first.save()
							puts "integrante Associado"
						else
							puts "Ok, adeus"
						end
					end
				end
			end
		else
			puts("Não foi encontrado nenhuma Orquestra com esse nome")
		end
	end
end

def AssociarInstrumentoIntegrante
	puts "Deseja ver uma lista de instrumentos disponiveis ?"
	resp=gets.chomp.downcase		
	if(resp=="sim" || resp=="s")
		listaInstrumento=Instrument.all
		puts "----------------------------------"
		listaInstrumento.each do |instrumentoListado|
			puts "Id: #{instrumentoListado.id} Nome: #{instrumentoListado.tipo}"
			puts "----------------------------------"
		end
	end
	puts("Digite o ID do Instrumento que você quer Associar à um integrante ,caso não deseje associar a nenhum Integrante aperte enter")
	idInst=gets.chomp
	if(idInst!="")
		instrumentoFind=Instrument.where(:id => idInst).first
		if(instrumentoFind != nil)
			puts "Deseja ver uma lista de integrantes disponiveis ?"
			resp=gets.chomp.downcase		
			if(resp=="sim" || resp=="s")
				listaIntegrante=Integrant.all
				puts "----------------------------------"
				listaIntegrante.each do |integranteListado|
					if(integranteListado.nome != nil)
						puts "Id: #{integranteListado.id} Nome: #{integranteListado.nome}"
						puts "----------------------------------"
					end
				end
			end
			puts("Qual o ID do Integrante que você deseja associar a seu instrumento")
			idintegrante=gets.chomp
			if(idintegrante!="")
				integranteFind=Integrant.where(:id=> idintegrante)
				if(!integranteFind.empty?)
					if(integranteFind.first.instrument_id!=nil)
						puts("Já existe um instrumento associado a esse integrante deseja dessasocia-lo ?")
						resp=gets.chomp.downcase		
						if(resp=="sim" || resp=="s")
							integranteFind.first.instrument_id=instrumentoFind.id
							integranteFind.first.save()
							puts "integrante Associado"
						else
							puts "Ok, adeus"
						end
					else
						puts "Deseja associar o integrante #{integranteFind.first.nome} ao Instrumento #{instrumentoFind.tipo}"
						resp=gets.chomp.downcase		
						if(resp=="sim" || resp=="s")
							integranteFind.first.instrument_id=instrumentoFind.id
							integranteFind.first.save()
							puts "integrante Associado"
						else
							puts "Ok, adeus"
						end
					end
				end
			end
		else
			puts("Não foi encontrado nenhum Instrumento com esse nome")
		end
	end
end


def limparTela()
	puts "Aperte enter para continuar"
	res=gets.chomp
	system "clear"
end

def Main
	loop=true;
	system "clear"
	while(loop)
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		puts "#     Gerenciador de orquestras       #"
		puts "#                                     #"
		puts "#     Digite um número abaixo         #"
		puts "#     para continuar                  #"
		puts "#                                     #"
		puts "#     1-Orquestra                     #"
		puts "#     2-Maestro                       #"
		puts "#     3-Integrante                    #"
		puts "#     4-Instrumentos                  #"
		puts "#     5-Sair                          #"
		puts "#                                     #"
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		opc=gets.chomp
		case opc
			when "1"
			 MenuOrquestra()
			when "2"
			 MenuMaestro()
			when "3"
			 MenuIntegrante()
			when "4"
			 MenuInstrumento()
		    when "5"
			 loop=false
			 system "clear"
			else
			 system "clear"	
			 puts "Opcão Inválida"
		end
	end
end


def MenuOrquestra
	loop=true
	system "clear"
	while(loop)
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		puts "#     Gerenciador de orquestras       #"
		puts "#                                     #"
		puts "#            Orquestras               #"
		puts "#                                     #"
		puts "#     Digite um número abaixo         #"
		puts "#     para continuar                  #"
		puts "#                                     #"
		puts "#     1-Criar Orquestra               #"
		puts "#     2-Alterar Orquestra             #"
		puts "#     3-Apagar Orquestra              #"
		puts "#     4-Mostrar Orquestra             #"
		puts "#     5-Associar Maestro              #"
		puts "#     6-Associar Integrante           #"
		puts "#     7-Associar Instrumento          #"
		puts "#     8-Sair                          #"
		puts "#                                     #"
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		opc = gets.chomp
		orc = Orchestra.new()
		case opc
			when "1"
				system "clear"
				orc.CriarOrquestra()
				limparTela()
			when "2"
				system "clear"
				orc.AlterarOrquestra()
				limparTela()
			when "3"
				system "clear"
				orc.ApagarOrquestra()
				limparTela()
			when "4"
				system "clear"
				orc.MostrarOrquestras()
				limparTela()
			when "5"
				system "clear"
				AssociarOrquestraMaestro()
				limparTela()
			when "6"
				system "clear"
				AssociarOrquestraIntegrante()
				limparTela()
			when "7"
				system "clear"
				AssociarOrquestraInstrumento()
				limparTela()
			when "8"
			 loop = false;
			 system "clear"
			else
			  system "clear"	
			  puts "Opção inválida"
		end
	end
end


def MenuMaestro
	loop=true;
	system "clear"
	while(loop)
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		puts "#     Gerenciador de orquestras       #"
		puts "#                                     #"
		puts "#            Maestro                  #"
		puts "#                                     #"
		puts "#     Digite um número abaixo         #"
		puts "#     para continuar                  #"
		puts "#                                     #"
		puts "#     1-Criar Maestro                 #"
		puts "#     2-Alterar Maestro               #"
		puts "#     3-Apagar Maestro                #"
		puts "#     4-Mostrar Maestro               #"
		puts "#     5-Associar à orquestra          #"
		puts "#     6-Sair                          #"
		puts "#                                     #"
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		opc=gets.chomp
		orc=Conductor.new()
		case opc
			when "1"
			 system "clear"	
			 orc.CriarMaestro()
			 limparTela()
			when "2"
			 system "clear"	
			 orc.AlterarMaestro()
			 limparTela()
			when "3"
			 system "clear"	
			 orc.ApagarMaestro()
			 limparTela()
			when "4"
			 system "clear"	
			 orc.MostrarMaestro()
			 limparTela()
			when "5"
			 system "clear"	
			 AssociarOrquestraMaestro()
			 limparTela()
			when "6"
			 loop=false
			 system "clear"
			else
			 system "clear"	
			 puts "Opcão Inválida !"
		end
	end
end

def MenuIntegrante
	loop=true;
	system "clear"
	while(loop)
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		puts "#     Gerenciador de orquestras       #"
		puts "#                                     #"
		puts "#           Integrante                #"
		puts "#                                     #"
		puts "#     Digite um número abaixo         #"
		puts "#     para continuar                  #"
		puts "#                                     #"
		puts "#     1-Criar Integrante              #"
		puts "#     2-Alterar Integrante            #"
		puts "#     3-Apagar Integrante             #"
		puts "#     4-Mostrar Integrante            #"
		puts "#     5-Associar à Orquestra          #"
		puts "#     6-Associar à Instrumento        #"
		puts "#     7-Sair                          #"
		puts "#                                     #"
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		opc=gets.chomp
		orc=Integrant.new()
		case opc
			when "1"
				system "clear"
				orc.CriarIntegrante()
				limparTela()
			when "2"
				system "clear"
				orc.AlterarIntegrante()
				limparTela()
			when "3"
				system "clear"
				orc.ApagarIntegrante()
				limparTela()
			when "4"
				system "clear"
				orc.MostrarIntegrante()
				limparTela()
			when "5"
				system "clear"
				AssociarOrquestraIntegrante()
				limparTela()
			when "6"
				system "clear"
				AssociarInstrumentoIntegrante()
				limparTela()
			when "7"
			 loop=false
			 system "clear"
			else
			 system "clear"	
			 puts "Opcão Inválida !"
		end
	end
end

def MenuInstrumento
	loop=true;
	system "clear"
	while(loop)
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		puts "#     Gerenciador de orquestras       #"
		puts "#                                     #"
		puts "#           Instrumento               #"
		puts "#                                     #"
		puts "#     Digite um número abaixo         #"
		puts "#     para continuar                  #"
		puts "#                                     #"
		puts "#     1-Criar Instrumento             #"
		puts "#     2-Alterar Instrumento           #"
		puts "#     3-Apagar Instrumento            #"
		puts "#     4-Mostrar Instrumento           #"
		puts "#     5-Associar à Orquestra          #"
		puts "#     6-Associar à Integrante         #"
		puts "#     7-Sair                          #"
		puts "#                                     #"
		puts "#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#_#"
		opc=gets.chomp
		orc=Instrument.new()
		case opc
			when "1"
			 system "clear"
			 orc.CriarInstrumento()
			 limparTela()
			when "2"
			 system "clear"
			 orc.AlterarInstrumento()
			 limparTela()
			when "3"
			 system "clear"
			 ApagarInstrumento()
			 limparTela()
			when "4"
			 system "clear"
			 orc.MostrarInstrumento()
			 limparTela()
			when "5"
			 system "clear"
			 AssociarOrquestraInstrumento()
			 limparTela()
			when "6"
			 system "clear"
			 AssociarInstrumentoIntegrante()
			 limparTela()
			when "7"
			 loop=false
			 system "clear"
			else
			 system "clear"
			 puts "Opcão Inválida !"
		end
	end
end

Main()

# O bacana aqui é que não foram declarados os atributos da classe
# Pessoa. Para isto, o ActiveRecord vai até o banco de dados, procura
# pelos atributos daquela tabela e automaticamente as "insere" como
# atributos da classe.

# Para demonstrar como acessar estes atributos, vamos a alguns exemplos:

# Formas de inserir informação no banco de dados. 
# Método 1: campo a campo.#

#p = Pessoa.new()
#p.last_name = "Hansen"
#p.first_name = "Ola"
#p.address    = "Timoteivn 10"
#p.city       = "Sandnes"
#p.save()

# Método 1: em um único comando.
#p = Pessoa.new(:last_name  => "Svendson", 
               #:first_name => "Tove",
              # :address    => "Borgvn 23",
             #  :city       => "Sandnes")
#p.save()

#p = Pessoa.new(:last_name  => "Pettersen", 
              # :first_name => "Kari",
             #  :address    => "Storgt 20",
             #  :city       => "Stavanger")
#p.save()

# Formas de acessar o banco de dados;

# (1) Traz "todo o banco" para uma única variável (Array), e usar os
# iteradores para navegar lá dentro.

#p#essoas = Pessoa.all;
#pessoas.each do |p|
 # puts "#{p.id}, #{p.last_name}, #{p.first_name}, #{p.address}, #{p.city}"
#end

# (2) Usar o método "find", dando como parâmetro o pk. Verifique a
# classe resultante.

#p = Pessoa.find(1)
#puts "(Pessoa.find(1)): #{p.id}, #{p.last_name}, #{p.first_name}, #{p.address}, #{p.city}"

# (3) Usar os métodos do tipo "dynamic finders". Estes métodos não
# estão implementados em lugar nenhum. A composição é feita da
# seguinte forma: "<Objeto>.find_by_<nome do atributo>". Muito
# esquisito, mas isto é metaprogramação. Um código será "criado" a
# partir destes parâmetros para fazer a busca no BD. Uma coisa
# importante é que tem dois tipos de finders, o "find" e o
# "find_all". O primeiro retorna um objeto da classe espeficiada. O
# segundo retorna um array de objetos da classe.

#pes = Pessoa.find_all_by_city("Stavanger")
#pes.each do |p|
#  puts p.class
 # puts p.inspect
 # puts "(Pessoa.find(...): #{p.id}, #{p.last_name}, #{p.first_name}, #{p.address}, #{p.city}"
#end

# que é equivalente a 

#pes = Pessoa.find(:all, :conditions => ["city = ?", "Stavanger"])
#pes.each do |p|
 # puts p.class
 # puts p.inspect
 # puts "(Pessoa.find(...): #{p.id}, #{p.last_name}, #{p.first_name}, #{p.address}, #{p.city}"
#e##nd

