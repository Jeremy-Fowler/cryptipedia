

namespace cryptipedia.Services;

public class CryptidClassificationsService
{
  public CryptidClassificationsService(CryptidClassificationsRepository repository, CryptidsService cryptidsService)
  {
    _repository = repository;
    _cryptidsService = cryptidsService;
  }
  private readonly CryptidClassificationsRepository _repository;
  private readonly CryptidsService _cryptidsService;

  internal CryptidClassificationClassification CreateCryptidClassification(CryptidClassification cryptidClassificationData, string userId)
  {
    Cryptid cryptid = _cryptidsService.GetCryptidById(cryptidClassificationData.CryptidId);
    if (cryptid.DiscovererId != userId) throw new Exception($"YOU MUST HAVE DISCOVERED THE {cryptid.Name.ToUpper()} TO ADD A CLASSIFICATION");
    return _repository.CreateCryptidClassification(cryptidClassificationData);
  }

  internal List<CryptidClassificationClassification> GetCryptidClassificationsByCryptidId(int cryptidId)
  {
    return _repository.GetCryptidClassificationsByCryptidId(cryptidId);
  }

  private CryptidClassificationCryptid GetCryptidClassificationCryptidById(int cryptidClassificationId)
  {
    return _repository.GetCryptidClassificationCryptidById(cryptidClassificationId);
  }

  internal string DeleteCryptidClassification(int cryptidClassificationId, string userId)
  {
    CryptidClassificationCryptid cryptid = GetCryptidClassificationCryptidById(cryptidClassificationId);
    if (cryptid.DiscovererId != userId) throw new Exception($"YOU MUST HAVE DISCOVERED THE {cryptid.Name.ToUpper()} TO REMOVE A CLASSIFICATION");
    _repository.DeleteCryptidClassification(cryptidClassificationId);

    return $"Successfully removed classification from {cryptid.Name}!";
  }

  internal List<CryptidClassificationCryptid> GetCryptidClassificationsByClassificationId(int classificationId)
  {
    return _repository.GetCryptidClassificationsByClassificationId(classificationId);
  }
}
