namespace cryptipedia.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CryptidClassificationsController : ControllerBase
{
  public CryptidClassificationsController(Auth0Provider auth0Provider, CryptidClassificationsService cryptidClassificationsService)
  {
    _auth0Provider = auth0Provider;
    _cryptidClassificationsService = cryptidClassificationsService;
  }
  private readonly Auth0Provider _auth0Provider;
  private readonly CryptidClassificationsService _cryptidClassificationsService;

  [HttpPost]
  [Authorize]
  public async Task<ActionResult<CryptidClassificationClassification>> CreateCryptidClassification([FromBody] CryptidClassification cryptidClassificationData)
  {
    try
    {
      Account userInfo = await _auth0Provider.GetUserInfoAsync<Account>(HttpContext);
      CryptidClassificationClassification cryptidClassification = _cryptidClassificationsService.CreateCryptidClassification(cryptidClassificationData, userInfo.Id);
      return Ok(cryptidClassification);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}
