abstract class DocumentEntityMapper<Entity, Document> {
  Document toDocument(Entity entity);

  Entity toEntity(Document document);
}
