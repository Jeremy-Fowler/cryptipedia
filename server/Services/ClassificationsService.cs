namespace cryptipedia.Services;

public class ClassificationsService
{
  public ClassificationsService(ClassificationsRepository repository)
  {
    _repository = repository;
  }
  private readonly ClassificationsRepository _repository;

  internal List<Classification> GetAllClassifications()
  {
    return _repository.GetAllClassifications();
  }

  internal Classification GetRandomClassification()
  {
    return _repository.GetRandomClassification();
  }

  internal Classification GetClassificationById(int classificationId)
  {
    return _repository.GetClassificationById(classificationId);
  }
}
