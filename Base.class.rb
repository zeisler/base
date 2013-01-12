class Base
	def hashItOut(hash, num)
		@type_ = ""
		if hash.is_a?(Hash)
			hash.each { |key, value|
		   		if num >= 1 then @type_ += ", `#{key}` = '#{value}'"
				else @type_ += "`#{key}` = '#{value}'"
				end
				num = num + 1
			}
		else
			if num >= 1 then @type_ += ", `#{hash}`"
			else @type_ += "`#{hash}`"
			end
			num = num + 1
		end
		num
	end
	def select(select)
		@type = "SELECT"
		@selectValue ||= 0
		@select ||= "SELECT "
		@selectValue = hashItOut(select,@selectValue)
		@select += @type_
	end

	def update(update)
		@type = "UPDATE"
		@updateValue ||= 0
		@update ||="UPDATE  "
		@updateValue = hashItOut(update,@updateValue)
		@update  += @type_
	end

	def insert(to)
		@type = "INSERT"
		@insert = "INSERT INTO #{to}"
	end

	def set(set = Hash{})
		@setValue ||= 0
		@set ||="SET "
		@setValue = hashItOut(set,@setValue)
		@set  += @type_
	end

	def from(from)
		@fromValue ||= 0
		@from ||=" FROM "

		@fromValue = hashItOut(from,@fromValue)
		@from  += @type_
	end

	def where(where = Hash{})
		@whereValue ||= 0
		@where ||=" WHERE "
		condition = where['condition']
		where.delete('condition')
		where.each { |key, value|
	   		if @whereValue >= 1 then @where += " #{condition} `#{key}` = '#{value}'"
			else @where += " `#{key}` = '#{value}'"
			end
			@whereValue = @whereValue + 1
		}

	end
	def statement
		if @type == "UPDATE" then @statment = "#{@update} #{@set} #{@where}"
		elsif @type == "SELECT" then @statment = "#{@select} #{@from} #{@where}"
		elsif @type == "INSERT" then @statment = "#{@insert} #{@set} #{@where}"
		end
	end

	def print
		statement
		puts "#{@statment}"
	end
end
