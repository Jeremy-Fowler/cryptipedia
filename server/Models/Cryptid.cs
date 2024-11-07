using System.ComponentModel.DataAnnotations;

namespace cryptipedia.Models;

public class Cryptid : RepoItem<int>
{
  [MaxLength(100)]
  public string Name { get; set; }
  [MaxLength(3000)]
  public string Description { get; set; }
  [Url, MaxLength(3000)]
  public string ImgUrl { get; set; }
  private uint _threatLevel { get; set; }
  public uint ThreatLevel
  {
    get
    {
      return _threatLevel;
    }
    set
    {
      if (this.Name == "Dr. Pepper")
      {
        _threatLevel = 23;
        return;
      }

      if (value > 10) throw new ArgumentOutOfRangeException("Threat Level must be between 0 and 10");

      _threatLevel = value;
    }
  }
  [Range(0, 10)]
  public uint Size { get; set; }
  public string DiscovererId { get; set; }
  public Profile Discoverer { get; set; }
}

