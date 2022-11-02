function generate-migration --wraps='gradle generateMigration -PmigrationName=' --description 'alias generate-migration=gradle generateMigration -PmigrationName'
  gradle generateMigration -PmigrationName=$argv; 
end
