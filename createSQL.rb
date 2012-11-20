open("newOffenseCodes.txt").each do |record|

  flag, code, type, description, ncgeneralstatue, offensestartdate, offenseenddate, clas, classstartdate, classenddate, dwireport, maxdate, typeofletter, english, spanish, updatedatetime, updateuser = record.split("\t")

  baseSQL = "INSERT INTO [Playground].[dbo].[OffenseCode] ([OffenseCodeId], [Flag],[Code],[Type],[OffenseDescription],[NCGeneralStatue],[OffenseStartDate],[OffenseEndDate],[Class],[ClassStartDate],[ClassEndDate],[DWIReport],[MaxDate],[TypeOfletter],[EnglishLaymanDescription],[SpanishLaymanDescription],[UpdateDatetime],[UpdateUser]) VALUES ("
  values =  "newid(), '#{flag.chomp}', '#{code.chomp}', '#{type.chomp}', '#{description.strip}', '#{ncgeneralstatue.strip}', '#{offensestartdate.chomp}', '#{offenseenddate}', '#{clas}', '#{classstartdate}', '#{classenddate}', '#{dwireport}', '#{maxdate}', '#{typeofletter}', '#{english.strip}', '#{spanish.strip}', GetDate(), 'mjeaton')"

  puts baseSQL + values
end
