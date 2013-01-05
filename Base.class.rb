class Base
	attr_accessor :select, :selectValue, :update, :updateValue, :insert, :insertValue,
					:set, :setValue, :from, :fromValue, :where, :whereValue
	attr_writer :statment
	attr_writer :type
	def select(select)
		@type = "SELECT"

		if @selectValue == nil
			@selectValue = 0
		end
		if @select == nil
			@select ="SELECT "
		end
		if (@selectValue >= 1)
			@select += ", `#{select}`"
		else
			@select += "`#{select}`"
		end
		@selectValue = @selectValue + 1
	end

	def update(update)
		@type = "UPDATE"
		if @updateValue == nil
			@updateValue = 0
		end
		if @update == nil
			@update ="UPDATE  "
		end
		if (@updateValue >= 1)
			@update += ", `#{update}`"
		else
			@update += "`#{update}`"
		end
		@updateValue = @updateValue + 1
	end

	def insert(to)
		@type = "INSERT"
		if @insert == nil
			@insert ="INSERT INTO #{to}"
		end
	end

	def set(set = Hash{})
		if @setValue == nil
			@setValue = 0
		end
		if @set == nil
			@set ="SET "
		end
		set.each { |key, value|
   		if (@setValue >= 1)
			@set += ", `#{key}` = '#{value}'"
		else
			@set += "`#{key}` = '#{value}'"
		end
		@setValue = @setValue + 1
		}

	end

	def from(from)
		if @fromValue == nil
			@fromValue = 0
		end
		if @from == nil
			@from =" FROM "
		end
		if (@fromValue >= 1)
			@from += ", `#{from}`"
		else
			@from += "`#{from}`"
		end
		@fromValue = @fromValue + 1
	end

	def where(where = Hash{})
		if @whereValue == nil
			@whereValue = 0
		end
		if @where == nil
			@where =" WHERE "
		end
		condition = where['condition']
		where.delete('condition')
		where.each { |key, value|
   		if (@whereValue >= 1)
			@where += " #{condition} `#{key}` = '#{value}'"
		else
			@where += " `#{key}` = '#{value}'"
		end
		@whereValue = @whereValue + 1
		}


	end
	def statement
		if @type == "UPDATE"
			@statment = "#{@update} #{@set} #{@where}"
		elsif @type == "SELECT"
			@statment = "#{@select} #{@from} #{@where}"
		elsif @type == "INSERT"
			@statment = "#{@insert} #{@set} #{@where}"
		end
	end

	def print

		statement
		puts "#{@statment}"
	end
end
